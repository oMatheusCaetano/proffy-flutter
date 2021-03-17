import 'package:proffy/src/data/data_sources/contracts/lesson_data_source.dart';
import 'package:proffy/src/data/models/lesson.dart';

class LessonDataSourceImpl implements LessonDataSource {
  @override
  Future<List<Lesson>> getAll([Map<String, String> filters]) =>
      Future.value(<Lesson>[]);
}
