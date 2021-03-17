import 'package:proffy/src/data/data_sources/contracts/subject_data_source.dart';
import 'package:proffy/src/data/models/subject.dart';

class SubjectDataSourceImpl implements SubjectDataSource {
  @override
  Future<List<Subject>> getAll() => Future.value(<Subject>[]);
}
