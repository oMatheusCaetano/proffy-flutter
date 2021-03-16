class InputValidator {
  final String _value;
  String _message;

  InputValidator(this._value);

  String get validate => this._message;

  InputValidator notEmpty([
    String message = 'Este campo não pode estar vazio',
  ]) {
    if (this._message == null)
      this._message = this._value.isEmpty ? message : null;
    return this;
  }

  InputValidator min(
    int min, [
    String message = 'Este campo precisa de ao memos :min caracteres',
  ]) {
    message = 'Este campo precisa de ao memos $min caracteres';
    if (this._message == null)
      this._message = this._value.length < min ? message : null;
    return this;
  }

  InputValidator email([
    String message = 'Este campo precisa ter um e-mail válido',
  ]) {
    if (this._message == null)
      this._message = !RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(this._value)
          ? message
          : null;
    return this;
  }
}
