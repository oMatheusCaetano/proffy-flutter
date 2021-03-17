// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) {
  return Student(
    name: json['name'] as String,
    email: json['email'] as String,
    profilePhoto: json['profilePhoto'] as String,
  )..uid = json['uid'] as String;
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'profilePhoto': instance.profilePhoto,
    };
