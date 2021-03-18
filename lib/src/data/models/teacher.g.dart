// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) {
  return Teacher(
    name: json['name'] as String,
    email: json['email'] as String,
    profilePhoto: json['profilePhoto'] as String,
    phone: json['phone'] == null
        ? null
        : Phone.fromJson(json['phone'] as Map<String, dynamic>),
    bio: json['bio'] as String,
    favoriteLessons: (json['favoriteLessons'] as List)
        ?.map((e) =>
            e == null ? null : Lesson.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..uid = json['uid'] as String;
}

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'profilePhoto': instance.profilePhoto,
      'bio': instance.bio,
      'phone': instance.phone,
      'favoriteLessons': instance.favoriteLessons,
    };
