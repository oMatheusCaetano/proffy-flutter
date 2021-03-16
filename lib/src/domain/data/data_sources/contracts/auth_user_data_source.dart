import 'package:proffy/src/domain/data/models/user.dart';

abstract class AuthUserDataSource {
  Future<User> getCurrentUser();
}
