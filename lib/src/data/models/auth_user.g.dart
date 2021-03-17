// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUser _$AuthUserFromJson(Map<String, dynamic> json) {
  return AuthUser(
    uid: json['uid'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    profilePhoto: json['profilePhoto'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$AuthUserToJson(AuthUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'profilePhoto': instance.profilePhoto,
      'password': instance.password,
    };
