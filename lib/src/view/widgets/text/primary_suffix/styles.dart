import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proffy/src/view/utils/pallete.dart';

mixin PrimarySuffixStyles {
  TextStyle textStyle() {
    return GoogleFonts.poppins(color: Pallete.text, fontSize: 16);
  }

  TextStyle rightStyle() {
    return GoogleFonts.poppins(
      color: Pallete.primary,
      fontWeight: FontWeight.bold,
    );
  }
}
