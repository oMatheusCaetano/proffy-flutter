// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return Lesson(
    subject: json['subject'] == null
        ? null
        : Subject.fromJson(json['subject'] as Map<String, dynamic>),
    teacher: json['teacher'] == null
        ? null
        : Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
    price: (json['price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'price': instance.price,
      'subject': instance.subject,
      'teacher': instance.teacher,
    };
