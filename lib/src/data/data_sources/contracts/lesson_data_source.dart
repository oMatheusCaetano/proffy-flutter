import 'package:proffy/src/data/models/lesson.dart';

abstract class LessonDataSource {
  Future<List<Lesson>> getAll();
}
