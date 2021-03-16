import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proffy/src/view/utils/pallete.dart';

abstract class AppTheme {
  static void setSystemTheme({
    Color navBarColor,
    Brightness navBarMode,
  }) {
    return SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: navBarColor ?? Pallete.background,
      systemNavigationBarIconBrightness: navBarMode ?? Brightness.dark,
    ));
  }

  static ThemeData get theme {
    return ThemeData(
      accentColor: Pallete.secondary,
      primaryColor: Pallete.secondary,
      appBarTheme: AppBarTheme(elevation: 0, backgroundColor: Pallete.primary),
      scaffoldBackgroundColor: Pallete.background,
      textTheme: GoogleFonts.poppinsTextTheme(
        TextTheme(
          bodyText1: TextStyle(color: Pallete.title),
          bodyText2: TextStyle(color: Pallete.text),
        ),
      ),
    );
  }
}
