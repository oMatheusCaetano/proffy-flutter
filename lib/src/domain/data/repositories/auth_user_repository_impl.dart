import 'package:proffy/src/domain/data/data_sources/contracts/auth_user_data_source.dart';
import 'package:proffy/src/domain/data/models/user.dart';
import 'package:proffy/src/domain/repositories/auth_user_repository.dart';

class AuthUserRepositoryImpl implements AuthUserRepository {
  final AuthUserDataSource _dataSource;

  AuthUserRepositoryImpl(this._dataSource);

  Future<User> getCurrentUser() => this._dataSource.getCurrentUser();
}
