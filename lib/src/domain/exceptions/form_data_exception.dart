class FormDataException implements Exception {
  String _message;

  FormDataException(this._message);

  String get message => this._message;
}
