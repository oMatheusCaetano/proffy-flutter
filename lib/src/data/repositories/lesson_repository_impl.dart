import 'package:proffy/src/data/data_sources/contracts/lesson_data_source.dart';
import 'package:proffy/src/data/models/lesson.dart';
import 'package:proffy/src/data/models/teacher.dart';
import 'package:proffy/src/domain/repositories/lesson_repository.dart';

class LessonRepositoryImpl implements LessonRepository {
  final LessonDataSource _dataSource;

  LessonRepositoryImpl(this._dataSource);

  @override
  Future<List<Lesson>> getAll([Map<String, String> filters]) {
    return this._dataSource.getAll(filters);
  }

  @override
  Future<List<Lesson>> getFavorites() => this._dataSource.getFavorites();

  @override
  Future<List<Lesson>> fromTeacher(Teacher teacher) {
    return this._dataSource.fromTeacher(teacher);
  }

  @override
  Future<Lesson> createOrUpdate(Lesson lesson) {
    return this._dataSource.createOrUpdate(lesson);
  }
}
