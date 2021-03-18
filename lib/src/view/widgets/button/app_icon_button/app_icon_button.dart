import 'package:flutter/material.dart';

import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/src/view/widgets/button/app_icon_button/styles.dart';
import 'package:proffy/utils/image_resolver.dart' as image;

class AppIconButton extends StatelessWidget with AppIconButtonStyles {
  final String icon;
  final double height;
  final Color backgroundColor;
  final void Function() onTap;

  AppIconButton(
    this.icon, {
    Key key,
    this.backgroundColor,
    this.height = 56,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: ElevatedButton(
        style: buttonStyle(backgroundColor ?? Pallete.primary),
        child: image.assetImg(image.heartOutlined, height: 20),
        onPressed: onTap,
      ),
    );
  }
}
