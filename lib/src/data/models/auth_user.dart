import 'dart:convert';

import 'package:proffy/src/domain/entities/auth_user_entity.dart';

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
    return AuthUser(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      profilePhoto: json['profilePhoto'],
      password: json['password'],
    );
  }

  factory AuthUser.fromJsonString(String jsonString) {
    return AuthUser.fromJson(json.decode(jsonString));
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': this.uid,
      'name': this.name,
      'email': this.email,
      'profilePhoto': this.profilePhoto,
      'password': this.password,
    };
  }

  String toJsonString() => json.encode(this.toJson());
}
