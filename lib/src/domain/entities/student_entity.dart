import 'package:proffy/src/domain/entities/enums.dart';
import 'package:proffy/src/domain/entities/lesson_entity.dart';
import 'package:proffy/src/domain/entities/user_entity.dart';

class StudentEntity extends UserEntity {
  List<LessonEntity> _favoriteLessons;
  final UserType _type = UserType.Student;

  StudentEntity({
    String name,
    String email,
    String profilePhoto,
    List<LessonEntity> favoriteLessons,
  }) : super(name: name, email: email, profilePhoto: profilePhoto);

  List<LessonEntity> get favoriteLessons => this._favoriteLessons;
  UserType get type => this._type;

  set favoriteLessons(List<LessonEntity> favoriteLessons) =>
      this._favoriteLessons = favoriteLessons;
}
