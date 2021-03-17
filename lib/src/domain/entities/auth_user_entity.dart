import 'package:proffy/src/domain/entities/enums.dart';
import 'package:proffy/src/domain/entities/user_entity.dart';

abstract class AuthUserEntity extends UserEntity {
  String _password;
  UserType _type = UserType.Auth;

  AuthUserEntity({
    String uid,
    String name,
    String email,
    String profilePhoto,
    String password,
  }) : super(uid: uid, name: name, email: email, profilePhoto: profilePhoto) {
    this.password = password;
  }

  String get password => this._password;
  UserType get type => this._type;

  set password(String password) => this._password = password;
}
