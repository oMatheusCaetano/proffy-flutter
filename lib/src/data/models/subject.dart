import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:proffy/src/domain/entities/subject_entity.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject extends SubjectEntity {
  Subject({String title}) : super(title: title);

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  factory Subject.fromJsonString(String jsonString) {
    return Subject.fromJson(json.decode(jsonString));
  }

  Map<String, dynamic> toJson() => _$SubjectToJson(this);

  String toJsonString() => json.encode(this.toJson());
}
