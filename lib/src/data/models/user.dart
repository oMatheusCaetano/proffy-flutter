import 'dart:convert';

import 'package:proffy/src/domain/entities/user_entity.dart';

class User extends UserEntity {
  User({String uid, String name, String email, String profilePhoto})
      : super(uid: uid, name: name, email: email, profilePhoto: profilePhoto);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      profilePhoto: json['profilePhoto'],
    );
  }

  factory User.fromJsonString(String jsonString) {
    return User.fromJson(json.decode(jsonString));
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': this.uid,
      'name': this.name,
      'email': this.email,
      'profilePhoto': this.profilePhoto,
    };
  }

  String toJsonString() => json.encode(this.toJson());
}
