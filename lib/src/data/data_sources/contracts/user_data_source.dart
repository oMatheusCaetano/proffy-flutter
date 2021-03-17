import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/domain/entities/enums.dart';

abstract class UserDataSource {
  Future<dynamic> create(AuthUser user, UserType type);
}