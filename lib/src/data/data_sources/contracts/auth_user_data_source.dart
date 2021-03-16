import 'package:proffy/src/data/models/user.dart';

abstract class AuthUserDataSource {
  Future<User> getCurrentUser();
}
