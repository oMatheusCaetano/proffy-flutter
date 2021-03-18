// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return Lesson(
    uid: json['uid'] as String,
    subject: json['subject'] == null
        ? null
        : Subject.fromJson(json['subject'] as Map<String, dynamic>),
    teacher: json['teacher'] == null
        ? null
        : Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
    weekDay: json['weekDay'] as String,
    price: (json['price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$LessonToJson(Lesson instance) => <String, dynamic>{
      'uid': instance.uid,
      'weekDay': instance.weekDay,
      'price': instance.price,
      'subject': instance.subject,
      'teacher': instance.teacher,
    };
