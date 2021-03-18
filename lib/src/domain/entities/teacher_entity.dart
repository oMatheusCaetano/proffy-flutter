import 'package:proffy/src/domain/entities/enums.dart';
import 'package:proffy/src/domain/entities/lesson_entity.dart';
import 'package:proffy/src/domain/entities/phone_entity.dart';
import 'package:proffy/src/domain/entities/user_entity.dart';

class TeacherEntity extends UserEntity {
  String _bio;
  PhoneEntity _phone;
  List<LessonEntity> _favoriteLessons;
  final UserType _type = UserType.Teacher;

  TeacherEntity({
    String name,
    String email,
    String profilePhoto,
    PhoneEntity phone,
    String bio,
    List<LessonEntity> favoriteLessons,
  }) : super(name: name, email: email, profilePhoto: profilePhoto) {
    this.bio = bio;
    this.phone = phone;
    this.favoriteLessons = favoriteLessons;
  }

  String get bio => this._bio;
  PhoneEntity get phone => this._phone;
  List<LessonEntity> get favoriteLessons => this._favoriteLessons;
  UserType get type => this._type;

  set bio(String bio) => this._bio = bio;
  set favoriteLessons(List<LessonEntity> favoriteLessons) =>
      this._favoriteLessons = favoriteLessons;
  set phone(PhoneEntity phone) => this._phone = phone;
}
