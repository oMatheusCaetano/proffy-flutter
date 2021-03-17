import 'package:proffy/src/domain/entities/enums.dart';
import 'package:proffy/src/domain/entities/user_entity.dart';

class StudentEntity extends UserEntity {
  final UserType _type = UserType.Student;

  StudentEntity({String name, String email, String profilePhoto})
      : super(name: name, email: email, profilePhoto: profilePhoto);

  UserType get type => this._type;
}
