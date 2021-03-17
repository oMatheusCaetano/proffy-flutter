import 'package:proffy/src/domain/entities/enums.dart';
import 'package:proffy/src/domain/entities/phone_entity.dart';
import 'package:proffy/src/domain/entities/user_entity.dart';

class TeacherEntity extends UserEntity {
  String _bio;
  PhoneEntity _phone;
  final UserType _type = UserType.Teacher;

  TeacherEntity({
    String name,
    String email,
    String profilePhoto,
    PhoneEntity phone,
    String bio,
  }) : super(name: name, email: email, profilePhoto: profilePhoto) {
    this.bio = bio;
    this.phone = phone;
  }

  String get bio => this._bio;
  PhoneEntity get phone => this._phone;
  UserType get type => this._type;

  set bio(String bio) => this._bio = bio;
  set phone(PhoneEntity phone) => this._phone = phone;
}
