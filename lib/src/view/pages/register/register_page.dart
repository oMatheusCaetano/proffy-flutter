import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proffy/src/view/controllers/register_page_controller.dart';
import 'package:proffy/src/view/utils/app_theme.dart';
import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/src/view/widgets/button/button/button.dart';
import 'package:proffy/src/view/widgets/button/link_button/link_button.dart';
import 'package:proffy/src/view/widgets/input/input.dart';
import 'package:proffy/utils/injection.dart';
import 'package:proffy/router/router.dart' as router;
import 'package:proffy/utils/image_resolver.dart' as image;
import 'package:proffy/utils/input_validator.dart';

class RegisterPage extends StatelessWidget {
  final controller = Injection.find<RegisterPageController>();

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
                controller.errorMessage.value.isNotEmpty
                    ? buildErrorMessage()
                    : SizedBox.shrink(),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Input(
                        label: 'Nome',
                        onChanged: (v) => controller.user.name = v,
                        validator: (value) =>
                            InputValidator(value).notEmpty().validate,
                      ),
                      SizedBox(height: 20),
                      Input(
                        label: 'E-mail',
                        validator: (value) =>
                            InputValidator(value).notEmpty().email().validate,
                        onChanged: (v) => controller.user.email = v,
                      ),
                      SizedBox(height: 20),
                      Input(
                        label: 'Senha',
                        obscure: true,
                        onChanged: (v) => controller.user.password = v,
                        validator: (value) =>
                            InputValidator(value).notEmpty().validate,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Button(
                  'Cadastrar',
                  onTap: controller.handleRegisterButtonClick,
                ),
                SizedBox(height: 30),
                LinkButton(
                  'Já possui uma conta? ',
                  boldText: ' Faça login!',
                  onTap: () => router.offNamed(
                    router.Login,
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

  Widget buildErrorMessage() {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      alignment: Alignment.center,
      child: Text(
        controller.errorMessage.value,
        style: GoogleFonts.archivo(
          color: Pallete.error,
          fontWeight: FontWeight.bold,
          fontSize: 16,
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
