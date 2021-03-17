import 'package:proffy/src/data/data_sources/contracts/lesson_data_source.dart';
import 'package:proffy/src/data/models/lesson.dart';
import 'package:proffy/src/domain/repositories/lesson_repository.dart';

class LessonRepositoryImpl implements LessonRepository {
  final LessonDataSource _dataSource;

  LessonRepositoryImpl(this._dataSource);

  @override
  Future<List<Lesson>> getAll() => this._dataSource.getAll();
}
