import 'package:flutter/material.dart';

import 'package:proffy/src/view/widgets/text/app_title/styles.dart';

class AppTitle extends StatelessWidget with AppTitleStyles {
  final String title;
  final Color color;
  final double fontSize;
  final bool bold;
  final bool archivo;

  AppTitle(
    this.title, {
    Key key,
    this.fontSize = 20,
    this.bold = false,
    this.color,
    this.archivo = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: titleStyle(color, fontSize, bold, archivo),
    );
  }
}
