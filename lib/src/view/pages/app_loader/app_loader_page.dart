import 'package:flutter/material.dart';

import 'package:proffy/src/view/controllers/app_loader_page_controller.dart';
import 'package:proffy/src/view/utils/app_theme.dart';
import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/utils/injection.dart';
import 'package:proffy/utils/image_resolver.dart' as image;

class AppLoaderPage extends StatelessWidget {
  final controller = Injection.find<AppLoaderPageController>();

  @override
  Widget build(BuildContext context) {
    _setSystemTheme();

    return Scaffold(
      backgroundColor: Pallete.primary,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: image.assetImg(image.splash),
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
