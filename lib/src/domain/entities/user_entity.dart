abstract class UserEntity {
  String _name;
  String _email;
  String _profilePhoto;

  UserEntity({String name, String email, String profilePhoto}) {
    this.name = name;
    this.email = email;
    this.profilePhoto = profilePhoto;
  }

  String get name => this._name;
  String get email => this._email;
  String get profilePhoto => this._profilePhoto;

  set name(String name) => this._name = name;
  set email(String email) => this._email = email;
  set profilePhoto(String profilePhoto) => this._profilePhoto = profilePhoto;
}
