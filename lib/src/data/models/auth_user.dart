import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:proffy/src/domain/entities/auth_user_entity.dart';

part 'auth_user.g.dart';

@JsonSerializable()
class AuthUser extends AuthUserEntity {
  AuthUser({
    String uid,
    String name,
    String email,
    String profilePhoto,
    String password,
  }) : super(
          uid: uid,
          name: name,
          email: email,
          profilePhoto: profilePhoto,
          password: password,
        );

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return _$AuthUserFromJson(json);
  }

  factory AuthUser.fromJsonString(String jsonString) {
    return AuthUser.fromJson(json.decode(jsonString));
  }

  Map<String, dynamic> toJson() {
    return _$AuthUserToJson(this)..addAll({'type': this.type.toString()});
  }

  String toJsonString() => json.encode(this.toJson());
}
