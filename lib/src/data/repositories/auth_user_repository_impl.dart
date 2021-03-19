import 'package:proffy/src/data/data_sources/contracts/auth_user_data_source.dart';
import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/data/models/user.dart';
import 'package:proffy/src/domain/repositories/auth_user_repository.dart';

class AuthUserRepositoryImpl implements AuthUserRepository {
  final AuthUserDataSource _dataSource;

  AuthUserRepositoryImpl(this._dataSource);

  Future<dynamic> getCurrentUser() => this._dataSource.getCurrentUser();
  Future<User> login(AuthUser user) => this._dataSource.login(user);
  Future<void> logout() => this._dataSource.logout();
}
