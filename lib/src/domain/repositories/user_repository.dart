import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/domain/entities/enums.dart';

abstract class UserRepository {
  Future<dynamic> create(AuthUser user, UserType type);
}
