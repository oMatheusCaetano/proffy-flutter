import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/domain/repositories/auth_user_repository.dart';
import 'package:proffy/router/router.dart' as router;

class RegisterPageController extends GetxController {
  // final AuthUserRepository authUserRepository;
  final formKey = GlobalKey<FormState>();
  final user = AuthUser(
    name: '',
    email: '',
    password: '',
  );

  // RegisterPageController(this.authUserRepository);

  void handleRegisterButtonClick() async {
    if (formKey.currentState?.validate() ?? true) {
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
}
