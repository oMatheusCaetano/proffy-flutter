import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/data/models/lesson.dart';
import 'package:proffy/src/domain/entities/enums.dart';

abstract class UserDataSource {
  Future<dynamic> create(AuthUser user, UserType type);
  Future<Map<String, dynamic>> getUserMapfromUid(String uid);
  Future<void> addFavorite(Lesson lesson);
  Future<void> removeFavorite(Lesson lesson);
}
