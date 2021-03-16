import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin IconTextButtonStyles {
  ButtonStyle buttonStyle(Color color) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(color),
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 30),
      ),
    );
  }

  TextStyle textStyle() {
    return GoogleFonts.archivo(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );
  }
}
