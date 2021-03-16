import 'package:flutter/material.dart';

import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/src/view/widgets/button/icon_text_button/styles.dart';

class Button extends StatelessWidget with IconTextButtonStyles {
  final Color color;
  final String text;
  final void Function() onTap;

  Button(
    this.text, {
    Key key,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: ElevatedButton(
        style: buttonStyle(color ?? Pallete.secondary),
        child: Text(text, style: textStyle()),
        onPressed: onTap,
      ),
    );
  }
}
