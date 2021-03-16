import 'package:flutter/material.dart';

import 'package:proffy/utils/image_resolver.dart' as image;

class TextEndIcon extends StatelessWidget {
  final String text;
  final String iconPath;
  final String top;
  final Color color;
  final Color iconColor;

  const TextEndIcon(
    this.text, {
    Key key,
    this.iconPath,
    this.top,
    this.color = Colors.white,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(top ?? '', style: TextStyle(color: color)),
        Row(
          children: [
            Text(text, style: TextStyle(color: color)),
            SizedBox(width: 5),
            image.assetImg(iconPath, color: iconColor),
          ],
        )
      ],
    );
  }
}
