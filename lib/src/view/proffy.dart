import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/view/utils/app_theme.dart';
import 'package:proffy/router/routes.dart' as router;

class Proffy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme.setSystemTheme();

    return GetMaterialApp(
      title: 'Proffy',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: router.AppLoader,
      getPages: router.routes,
    );
  }
}
