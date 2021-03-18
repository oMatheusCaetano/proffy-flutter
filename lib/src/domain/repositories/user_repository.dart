import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/data/models/lesson.dart';
import 'package:proffy/src/domain/entities/enums.dart';

abstract class UserRepository {
  Future<dynamic> create(AuthUser user, UserType type);
  Future<void> addFavorite(Lesson lesson);
  Future<void> removeFavorite(Lesson lesson);
}
