import 'package:proffy/src/data/data_sources/contracts/subject_data_source.dart';
import 'package:proffy/src/data/models/subject.dart';
import 'package:proffy/src/domain/repositories/subject_repository.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  final SubjectDataSource _dataSource;

  SubjectRepositoryImpl(this._dataSource);

  @override
  Future<List<Subject>> getAll() => this._dataSource.getAll();
}
