import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:proffy/src/data/models/subject.dart';
import 'package:proffy/src/data/models/teacher.dart';
import 'package:proffy/src/domain/entities/lesson_entity.dart';

part 'lesson.g.dart';

@JsonSerializable()
class Lesson extends LessonEntity {
  Lesson({
    Subject subject,
    Teacher teacher,
    String weekDay,
    double price,
  }) : super(
          subject: subject,
          teacher: teacher,
          weekDay: weekDay,
          price: price,
        );

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return _$LessonFromJson(json);
  }

  factory Lesson.fromJsonString(String jsonString) {
    return Lesson.fromJson(json.decode(jsonString));
  }

  Map<String, dynamic> toJson() => _$LessonToJson(this);

  String toJsonString() => json.encode(this.toJson());

  @override
  Subject get subject => super.subject as Subject;

  @override
  Teacher get teacher => super.teacher as Teacher;
}
