import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:proffy/src/data/models/lesson.dart';
import 'package:proffy/src/domain/entities/student_entity.dart';

part 'student.g.dart';

@JsonSerializable()
class Student extends StudentEntity {
  Student({
    String name,
    String email,
    String profilePhoto,
    List<Lesson> favoriteLessons,
  }) : super(
          name: name,
          email: email,
          profilePhoto: profilePhoto,
          favoriteLessons: favoriteLessons,
        );

  factory Student.fromJson(Map<String, dynamic> json) {
    return _$StudentFromJson(json);
  }

  factory Student.fromJsonString(String jsonString) {
    return Student.fromJson(json.decode(jsonString));
  }

  Map<String, dynamic> toJson() {
    return _$StudentToJson(this)..addAll({'type': this.type.toString()});
  }

  String toJsonString() => json.encode(this.toJson());

  @override
  List<Lesson> get favoriteLessons =>
      super.favoriteLessons.map((e) => e as Lesson).toList();
}
