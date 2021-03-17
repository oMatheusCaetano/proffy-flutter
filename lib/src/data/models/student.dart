import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:proffy/src/domain/entities/student_entity.dart';

part 'student.g.dart';

@JsonSerializable()
class Student extends StudentEntity {
  Student({String name, String email, String profilePhoto})
      : super(name: name, email: email, profilePhoto: profilePhoto);

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
}
