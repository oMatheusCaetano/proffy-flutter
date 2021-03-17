import 'package:flutter/material.dart';
import 'package:proffy/src/view/utils/app_theme.dart';
import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/src/view/widgets/button/button/button.dart';
import 'package:proffy/src/view/widgets/input/input.dart';
import 'package:proffy/utils/image_resolver.dart' as image;

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme.setSystemTheme();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 50, 15, 50),
              child: Form(
                  child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Pallete.border),
                    ),
                    child: image.assetImg(image.hero),
                  ),
                  SizedBox(height: 30),
                  Input(label: 'Image URL', light: true),
                  SizedBox(height: 15),
                  Input(label: 'Name', light: true),
                  SizedBox(height: 15),
                  Input(label: 'Email', light: true),
                  SizedBox(height: 50),
                  Divider(),
                  Button('Salvar alterações'),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
