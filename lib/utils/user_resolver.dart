import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/data/models/student.dart';
import 'package:proffy/src/data/models/teacher.dart';
import 'package:proffy/src/domain/entities/enums.dart';

dynamic userSpecificationFromUser(
  dynamic user,
  UserType type, [
  Map<String, dynamic> extraData = const {},
]) {
  switch (type) {
    case UserType.Auth:
      return AuthUser.fromJson(user.toJson()..addAll(extraData));
    case UserType.Student:
      return Student.fromJson(user.toJson()..addAll(extraData));
    case UserType.Teacher:
      return Teacher.fromJson(user.toJson()..addAll(extraData));
    default:
      return null;
  }
}

UserType userTypeStringtoUserType(String type) {
  if (type == UserType.Auth.toString()) return UserType.Auth;
  if (type == UserType.Student.toString()) return UserType.Student;
  if (type == UserType.Teacher.toString()) return UserType.Teacher;
  return null;
}
