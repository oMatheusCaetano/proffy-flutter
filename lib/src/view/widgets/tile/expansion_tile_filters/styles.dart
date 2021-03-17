import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proffy/src/view/utils/pallete.dart';

mixin ExpansiontileFiltersStyles {
  TextStyle filterPlaceholderStyle() {
    return GoogleFonts.archivo(color: Pallete.textInPrimary, fontSize: 16);
  }
}
