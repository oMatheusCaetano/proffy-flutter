import 'package:flutter/material.dart';

import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/src/view/widgets/button/icon_text_button/styles.dart';
import 'package:proffy/utils/image_resolver.dart' as image;

class IconTextButton extends StatelessWidget with IconTextButtonStyles {
  final Color color;
  final String icon;
  final String text;
  final void Function() onTap;

  IconTextButton(
    this.text, {
    Key key,
    this.color,
    this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: ElevatedButton(
        style: buttonStyle(color ?? Pallete.secondary),
        child: Row(
          children: [
            image.assetImg(icon, height: 30),
            SizedBox(width: 15),
            Text(text, style: textStyle()),
          ],
        ),
        onPressed: onTap,
      ),
    );
  }
}
