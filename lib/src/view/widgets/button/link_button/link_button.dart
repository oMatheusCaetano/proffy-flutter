import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proffy/src/view/utils/pallete.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final String boldText;
  final void Function() onTap;

  LinkButton(this.text, {Key key, this.boldText, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: text),
            TextSpan(
              text: boldText,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Pallete.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
