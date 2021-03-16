import 'package:proffy/src/domain/entities/user_entity.dart';

abstract class AuthUserEntity extends UserEntity {
  String _password;

  AuthUserEntity({
    String name,
    String email,
    String profilePhoto,
    String password,
  }) : super(name: name, email: email, profilePhoto: profilePhoto) {
    this.password = password;
  }

  String get password => this._password;

  set password(String password) => this._password = password;
}
