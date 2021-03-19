import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/data/models/user.dart';

abstract class AuthUserRepository {
  Future<dynamic> getCurrentUser();
  Future<User> login(AuthUser user);
  Future<void> logout();
}
