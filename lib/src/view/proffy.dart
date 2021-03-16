import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/view/utils/app_theme.dart';
import 'package:proffy/router/router.dart' as router;
import 'package:proffy/utils/env.dart' as env;
import 'package:proffy/utils/injection.dart';

class Proffy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppTheme.setSystemTheme();

    return GetMaterialApp(
      title: env.appName,
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      initialBinding: Injection(),
      initialRoute: router.AppLoader,
      getPages: router.routes,
    );
  }
}
