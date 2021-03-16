import 'package:flutter/material.dart';

import 'package:proffy/src/view/widgets/text/primary_suffix/styles.dart';

class PrimarySuffix extends StatelessWidget with PrimarySuffixStyles {
  final String text;
  final String right;

  PrimarySuffix(this.text, {Key key, this.right}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: textStyle(),
        children: [
          TextSpan(text: text),
          TextSpan(
            text: right,
            style: rightStyle(),
          ),
        ],
      ),
    );
  }
}
