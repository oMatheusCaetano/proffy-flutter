class PhoneEntity {
  String _uid;
  String _number;

  PhoneEntity({String uid, String number}) {
    this.uid = uid;
    this.number = number;
  }

  String get uid => this._uid;
  String get number => this._number;

  set uid(String uid) => this._uid = uid;
  set number(String number) => this._number = number;
}
