import 'package:proffy/src/data/models/subject.dart';

abstract class SubjectDataSource {
  Future<List<Subject>> getAll();
}
