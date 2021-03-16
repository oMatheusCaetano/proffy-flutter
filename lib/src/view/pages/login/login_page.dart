import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/view/utils/app_theme.dart';
import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/src/view/widgets/button/button/button.dart';
import 'package:proffy/src/view/widgets/button/link_button/link_button.dart';
import 'package:proffy/src/view/widgets/input/input/input.dart';
import 'package:proffy/router/router.dart' as router;
import 'package:proffy/utils/image_resolver.dart' as image;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _setSystemTheme();

    return Scaffold(
      backgroundColor: Pallete.primary,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            constraints: BoxConstraints(maxWidth: 500),
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                image.assetImg(image.logo, width: 200),
                SizedBox(height: 40),
                Input(label: 'E-mail'),
                SizedBox(height: 20),
                Input(label: 'Senha'),
                SizedBox(height: 30),
                Button('Entrar', onTap: () {}),
                SizedBox(height: 30),
                LinkButton(
                  'Ainda não possui uma conta? ',
                  boldText: ' Cadastre-se!',
                  onTap: () => router.offNamed(
                    router.Register,
                    [router.params['userType']],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _setSystemTheme() {
    AppTheme.setSystemTheme(
      navBarColor: Pallete.primary,
      navBarMode: Brightness.light,
    );
  }
}
