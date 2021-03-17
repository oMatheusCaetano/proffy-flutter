import 'package:proffy/src/data/models/subject.dart';

abstract class SubjectRepository {
  Future<List<Subject>> getAll();
}
