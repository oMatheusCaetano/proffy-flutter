import 'package:proffy/src/data/models/lesson.dart';

abstract class LessonDataSource {
  Future<List<Lesson>> getAll([Map<String, String> filters]);
  Future<List<Lesson>> getFavorites();
  Future<Lesson> update(Lesson lesson);
}
