import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/domain/exceptions/form_data_exception.dart';
import 'package:proffy/src/domain/repositories/auth_user_repository.dart';
import 'package:proffy/src/domain/repositories/user_repository.dart';
import 'package:proffy/router/router.dart' as router;
import 'package:proffy/utils/storage.dart' as storage;
import 'package:proffy/utils/user_resolver.dart' as userResolver;

class RegisterPageController extends GetxController {
  final AuthUserRepository _authUserRepository;
  final UserRepository _userRepository;
  final formKey = GlobalKey<FormState>();
  final errorMessage = ''.obs;
  final loading = false.obs;
  final user = AuthUser(name: '', email: '', password: '');

  RegisterPageController(this._authUserRepository, this._userRepository);

  Future<void> _login() async {
    final loggedUser = await this._authUserRepository.login(user);
    await storage.write(storage.loggedUserUid, loggedUser.uid);
    router.offAllNamed(router.Profile);
  }

  void handleRegisterButtonClick() async {
    this.errorMessage.value = '';
    if (!this.formKey.currentState.validate()) return;
    try {
      this.loading.value = true;
      await this._userRepository.create(
            user,
            userResolver.userTypeStringtoUserType(router.params['userType']),
          );
      await this._login();
    } on FormDataException catch (exception) {
      this.errorMessage.value = exception.message;
    } finally {
      this.loading.value = false;
    }
  }
}
