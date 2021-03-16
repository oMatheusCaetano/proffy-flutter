import 'package:flutter/material.dart';

import 'package:proffy/src/view/utils/app_theme.dart';
import 'package:proffy/src/view/utils/pallete.dart';

mixin HomePageStyles {
  void setDeviceTheme() {
    AppTheme.setSystemTheme(
      navBarColor: Pallete.primary,
      navBarMode: Brightness.light,
    );
  }

  EdgeInsets containerPadding(BuildContext context, bool portrait) {
    double topPadding = MediaQuery.of(context).padding.top;
    return EdgeInsets.fromLTRB(
      portrait ? 16 : 40,
      portrait ? topPadding : topPadding + 20,
      portrait ? 16 : 40,
      portrait ? 40 : 20,
    );
  }
}
