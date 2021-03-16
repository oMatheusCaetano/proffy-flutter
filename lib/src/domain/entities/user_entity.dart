enum UserType { Teacher, Student, Auth }

abstract class UserEntity {
  String _uid;
  String _name;
  String _email;
  String _profilePhoto;

  UserEntity({String uid, String name, String email, String profilePhoto}) {
    this.uid = uid;
    this.name = name;
    this.email = email;
    this.profilePhoto = profilePhoto;
  }

  String get uid => this._uid;
  String get name => this._name;
  String get email => this._email;
  String get profilePhoto => this._profilePhoto;

  set uid(String uid) => this._uid = uid;
  set name(String name) => this._name = name;
  set email(String email) => this._email = email;
  set profilePhoto(String profilePhoto) => this._profilePhoto = profilePhoto;
}
