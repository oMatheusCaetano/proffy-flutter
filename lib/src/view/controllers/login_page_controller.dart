import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/domain/exceptions/form_data_exception.dart';
import 'package:proffy/src/domain/repositories/auth_user_repository.dart';
import 'package:proffy/utils/storage.dart' as storage;
import 'package:proffy/router/router.dart' as router;

class LoginPageController extends GetxController {
  final AuthUserRepository _authUserRepository;
  final formKey = GlobalKey<FormState>();
  final errorMessage = ''.obs;
  final loading = false.obs;
  final user = AuthUser(name: '', email: '', password: '');

  LoginPageController(this._authUserRepository);

  void handleLoginButtonClick() async {
    this.errorMessage.value = '';
    if (!this.formKey.currentState.validate()) return;
    try {
      this.loading.value = true;
      final loggedUser = await this._authUserRepository.login(user);
      await storage.write(storage.loggedUserUid, loggedUser.uid);
      router.offAllNamed(router.Profile);
    } on FormDataException catch (exception) {
      this.errorMessage.value = exception.message;
    } finally {
      this.loading.value = false;
    }
  }
}
