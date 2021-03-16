import 'package:proffy/src/domain/data/models/user.dart';

abstract class AuthUserRepository {
  Future<User> getCurrentUser();
}
