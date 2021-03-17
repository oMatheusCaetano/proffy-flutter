import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:proffy/src/view/utils/pallete.dart';

mixin DropDownStyles {
  TextStyle filterLabelStyle() {
    return TextStyle(color: Pallete.placeholder, fontSize: 12);
  }

  TextStyle filterInputPlaceholderStyle() {
    return GoogleFonts.archivo(color: Pallete.text.withOpacity(.5));
  }
}
