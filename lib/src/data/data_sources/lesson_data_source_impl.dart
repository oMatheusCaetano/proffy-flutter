import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:proffy/src/data/data_sources/contracts/lesson_data_source.dart';
import 'package:proffy/src/data/data_sources/contracts/user_data_source.dart';
import 'package:proffy/src/data/models/lesson.dart';
import 'package:proffy/src/data/models/teacher.dart';
import 'package:proffy/utils/storage.dart' as storage;

class LessonDataSourceImpl implements LessonDataSource {
  final FirebaseFirestore _firestore;
  final UserDataSource _userDataSource;

  LessonDataSourceImpl(this._firestore, this._userDataSource);

  @override
  Future<List<Lesson>> getAll([Map<String, String> filters]) async {
    Query query = this._firestore.collection('lessons').where('all');

    query = filters != null ? _handleFilters(query, filters) : query;

    final lessonsSnapshot = await query.get();
    final lessonsData = lessonsSnapshot.docs.map((e) => e.data()).toList();

    for (var e in lessonsData) {
      e['teacher'] =
          await this._userDataSource.getUserMapfromUid(e['teacherId']);
    }

    return lessonsData.map((lesson) => Lesson.fromJson(lesson)).toList();
  }

  @override
  Future<List<Lesson>> getFavorites() async {
    String userUid = await storage.read(storage.loggedUserUid);
    final user = await this._userDataSource.getUserMapfromUid(userUid);
    final lessons = [];

    for (var uid in user['favoriteLessonsIds']) {
      final lesson = await this._firestore.collection('lessons').doc(uid).get();
      lessons.add(lesson.data());
    }

    return lessons.map((e) => Lesson.fromJson(e..['teacher'] = user)).toList();
  }

  @override
  Future<List<Lesson>> fromTeacher(Teacher teacher) async {
    final lessonsSnapshot = await this
        ._firestore
        .collection('lessons')
        .where('teacherId', isEqualTo: teacher.uid)
        .get();

    final lessonsData = lessonsSnapshot.docs.map((e) => e.data()).toList();
    for (var e in lessonsData) {
      e['teacher'] =
          await this._userDataSource.getUserMapfromUid(e['teacherId']);
    }

    return lessonsData.map((lesson) => Lesson.fromJson(lesson)).toList();
  }

  @override
  Future<Lesson> createOrUpdate(Lesson lesson) {
    return Future.value(lesson);
  }

  Query _handleFilters(Query query, Map<String, String> filters) {
    if (filters != null) {
      if (filters['weekDay'] != null && filters['weekDay'].isNotEmpty)
        query = query.where('weekDay', isEqualTo: filters['weekDay']);

      if (filters['subject'] != null && filters['subject'].isNotEmpty)
        query = query.where('subject.title', isEqualTo: filters['subject']);
    }
    return query;
  }
}
