import 'package:proffy/src/data/models/user.dart';

abstract class AuthUserRepository {
  Future<User> getCurrentUser();
}
