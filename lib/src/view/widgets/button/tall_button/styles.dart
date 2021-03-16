import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

mixin TallButtonStyles {
  ButtonStyle buttonStyle(Color color) {
    return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(EdgeInsets.all(25)),
      alignment: Alignment.topLeft,
      backgroundColor: MaterialStateProperty.all(
        color ?? Colors.white.withOpacity(.3),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  TextStyle textStyle() {
    return GoogleFonts.archivo(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
  }
}
