import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proffy/src/view/utils/pallete.dart';

mixin OnBoardingPageStyles {
  TextStyle numberStyle(BuildContext context) {
    return GoogleFonts.archivo(
      color: Theme.of(context).textTheme.bodyText1?.color?.withOpacity(.3),
      fontWeight: FontWeight.w500,
      fontSize: 40,
    );
  }

  BoxDecoration screenIndicator(Color color, [bool isCurrent = false]) {
    return BoxDecoration(
      color: isCurrent ? color : Pallete.text.withOpacity(.3),
    );
  }
}
