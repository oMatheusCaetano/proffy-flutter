import 'package:proffy/src/domain/entities/user_entity.dart';

class User extends UserEntity {
  User({String name, String email, String profilePhoto})
      : super(name: name, email: email, profilePhoto: profilePhoto);
}
