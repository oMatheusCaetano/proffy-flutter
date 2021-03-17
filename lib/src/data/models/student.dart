import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:proffy/src/domain/entities/user_entity.dart';

part 'student.g.dart';

@JsonSerializable()
class Student extends UserEntity {
  Student({String name, String email, String profilePhoto})
      : super(name: name, email: email, profilePhoto: profilePhoto);

  factory Student.fromJson(Map<String, dynamic> json) {
    return _$StudentFromJson(json);
  }

  factory Student.fromJsonString(String jsonString) {
    return Student.fromJson(json.decode(jsonString));
  }

  Map<String, dynamic> toJson() => _$StudentToJson(this);

  String toJsonString() => json.encode(this.toJson());
}
