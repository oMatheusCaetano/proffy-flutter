import 'package:proffy/src/data/models/lesson.dart';
import 'package:proffy/src/data/models/teacher.dart';

abstract class LessonDataSource {
  Future<List<Lesson>> getAll([Map<String, String> filters]);
  Future<List<Lesson>> getFavorites();
  Future<List<Lesson>> fromTeacher(Teacher teacher);
  Future<Lesson> createOrUpdate(Lesson lesson);
}
