import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin AppTitleStyles {
  TextStyle titleStyle(
    Color color,
    double fontSize,
    bool bold, [
    bool arquivo = true,
  ]) {
    return arquivo
        ? GoogleFonts.archivo(
            color: color,
            fontSize: fontSize,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          )
        : TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          );
  }
}
