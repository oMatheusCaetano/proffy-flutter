import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:proffy/src/domain/entities/user_entity.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends UserEntity {
  User({String uid, String name, String email, String profilePhoto})
      : super(uid: uid, name: name, email: email, profilePhoto: profilePhoto);

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  factory User.fromJsonString(String jsonString) {
    return User.fromJson(json.decode(jsonString));
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  String toJsonString() => json.encode(this.toJson());
}
