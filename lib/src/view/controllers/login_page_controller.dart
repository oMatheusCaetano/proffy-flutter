import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/domain/repositories/auth_user_repository.dart';
import 'package:proffy/router/router.dart' as router;

class LoginPageController extends GetxController {
  final AuthUserRepository authUserRepository;
  final formKey = GlobalKey<FormState>();
  final user = AuthUser(name: '', email: '', password: '');

  LoginPageController(this.authUserRepository);

  void handleLoginButtonClick() async {
    print(user.name);
    print(user.email);
    print(user.password);
  }
}
