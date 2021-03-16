import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/data/models/user.dart';

abstract class AuthUserRepository {
  Future<User> getCurrentUser();
  Future<User> login(AuthUser user);
}
