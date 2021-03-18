import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:proffy/src/domain/entities/phone_entity.dart';

part 'phone.g.dart';

@JsonSerializable()
class Phone extends PhoneEntity {
  Phone({String uid, String number}) : super(uid: uid, number: number);

  factory Phone.fromJson(Map<String, dynamic> json) => _$PhoneFromJson(json);

  factory Phone.fromJsonString(String jsonString) {
    return Phone.fromJson(json.decode(jsonString));
  }

  Map<String, dynamic> toJson() => _$PhoneToJson(this);

  String toJsonString() => json.encode(this.toJson());
}
