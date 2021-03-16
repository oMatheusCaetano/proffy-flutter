import 'package:proffy/src/domain/entities/auth_user_entity.dart';

class AuthUser extends AuthUserEntity {
  AuthUser({String name, String email, String profilePhoto, String password})
      : super(
          name: name,
          email: email,
          profilePhoto: profilePhoto,
          password: password,
        );
}
