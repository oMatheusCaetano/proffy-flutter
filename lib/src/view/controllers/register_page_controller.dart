import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/domain/exceptions/form_data_exception.dart';
import 'package:proffy/src/domain/repositories/auth_user_repository.dart';
import 'package:proffy/router/router.dart' as router;
import 'package:proffy/utils/storage.dart' as storage;

class RegisterPageController extends GetxController {
  final AuthUserRepository _authUserRepository;
  final formKey = GlobalKey<FormState>();
  final errorMessage = ''.obs;
  final loading = false.obs;
  final user = AuthUser(name: '', email: '', password: '');

  RegisterPageController(this._authUserRepository);

  Future<void> _login() async {
    final loggedUser = await this._authUserRepository.login(user);
    await storage.write(storage.loggedUserUid, loggedUser.uid);
    router.offAllNamed(router.Study);
  }

  void handleRegisterButtonClick() async {
    this.errorMessage.value = '';
    if (!this.formKey.currentState.validate()) return;
    try {
      this.loading.value = true;

      this._login();
    } on FormDataException catch (exception) {
      this.errorMessage.value = exception.message;
    } finally {
      this.loading.value = false;
    }

    // final result = await this.authUserRepository.createUser(user);
    // if (result != null) Get.offAllNamed(router.Study);
    // try {
    //   UserCredential userCredential =
    //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //     email: "barry.allen@example.com",
    //     password: "SuperSecretPassword!",
    //   );

    //   userCredential.user?.updateProfile(displayName: 'Nome de teste');
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     print('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     print('The account already exists for that email.');
    //   }
    // } catch (e) {
    //   print(e);
    // }
  }
}
