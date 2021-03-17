import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:proffy/src/data/models/phone.dart';
import 'package:proffy/src/domain/entities/teacher_entity.dart';

part 'teacher.g.dart';

@JsonSerializable()
class Teacher extends TeacherEntity {
  Teacher({
    String name,
    String email,
    String profilePhoto,
    Phone phone,
    String bio,
  }) : super(
          name: name,
          email: email,
          profilePhoto: profilePhoto,
          bio: bio,
          phone: phone,
        );

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return _$TeacherFromJson(json);
  }

  factory Teacher.fromJsonString(String jsonString) {
    return Teacher.fromJson(json.decode(jsonString));
  }

  Map<String, dynamic> toJson() => _$TeacherToJson(this);

  String toJsonString() => json.encode(this.toJson());

  @override
  Phone get phone => super.phone as Phone;
}
