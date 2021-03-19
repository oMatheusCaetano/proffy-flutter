import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proffy/src/view/utils/pallete.dart';

mixin ProfilePageStyles {
  TextStyle dropdownItemStyle() {
    return GoogleFonts.archivo(color: Pallete.text);
  }

  TextStyle modalTitleStyle([bool light = false]) {
    return GoogleFonts.archivo(
      color: light ? Pallete.textInPrimary : Pallete.text,
    );
  }

  TextStyle lessonStyle() {
    return TextStyle(color: Pallete.text);
  }
}
