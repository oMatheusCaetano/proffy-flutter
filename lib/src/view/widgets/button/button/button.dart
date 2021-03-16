import 'package:flutter/material.dart';

import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/src/view/widgets/button/icon_text_button/styles.dart';

class Button extends StatelessWidget with IconTextButtonStyles {
  final Color color;
  final String text;
  final bool loading;
  final void Function() onTap;

  Button(
    this.text, {
    Key key,
    this.color,
    this.onTap,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: ElevatedButton(
        style: buttonStyle(color ?? Pallete.secondary),
        child: loading
            ? CircularProgressIndicator(backgroundColor: Pallete.primary)
            : Text(text, style: textStyle()),
        onPressed: onTap,
      ),
    );
  }
}
