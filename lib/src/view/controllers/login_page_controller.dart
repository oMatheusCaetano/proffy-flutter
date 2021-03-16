import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/domain/exceptions/form_data_exception.dart';
import 'package:proffy/src/domain/repositories/auth_user_repository.dart';
import 'package:proffy/utils/input_validator.dart';
import 'package:proffy/router/router.dart' as router;

class LoginPageController extends GetxController {
  final AuthUserRepository _authUserRepository;
  final formKey = GlobalKey<FormState>();
  final errorMessage = ''.obs;
  final user = AuthUser(name: '', email: '', password: '');

  LoginPageController(this._authUserRepository);

  void handleLoginButtonClick() async {
    this.errorMessage.value = '';
    if (!this.formKey.currentState.validate()) return;
    try {
      await this._authUserRepository.login(user);
    } on FormDataException catch (exception) {
      this.errorMessage.value = exception.message;
    }
  }

  String emailFieldValidation(String value) {
    return InputValidator(value).notEmpty().email().validate;
  }

  String passwordFieldValidation(String value) {
    return InputValidator(value).notEmpty().min(6).validate;
  }
}
