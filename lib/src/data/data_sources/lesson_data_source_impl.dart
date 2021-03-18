import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proffy/src/data/data_sources/contracts/lesson_data_source.dart';
import 'package:proffy/src/data/models/lesson.dart';

class LessonDataSourceImpl implements LessonDataSource {
  final FirebaseFirestore _firestore;

  LessonDataSourceImpl(this._firestore);

  @override
  Future<List<Lesson>> getAll([Map<String, String> filters]) async {
    Query query = this._firestore.collection('lessons').where('all');

    if (filters != null) {
      if (filters['weekDay'] != null && filters['weekDay'].isNotEmpty)
        query = query.where('weekDay', isEqualTo: filters['weekDay']);

      if (filters['subject'] != null && filters['subject'].isNotEmpty)
        query = query.where('subject.title', isEqualTo: filters['subject']);
    }

    final snapshot = await query.get();
    return snapshot.docs.map((doc) => Lesson.fromJson(doc.data())).toList();
  }
}
