class PhoneEntity {
  String _number;

  PhoneEntity({String number}) {
    this.number = number;
  }

  String get number => this._number;

  set number(String number) => this._number = number;
}
