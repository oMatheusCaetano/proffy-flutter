import 'package:proffy/src/data/models/lesson.dart';

abstract class LessonRepository {
  Future<List<Lesson>> getAll([Map<String, String> filters]);
  Future<List<Lesson>> getFavorites();
}
