import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class ImageResolver {
  static const imagesPath = 'assets/img';
  static const imagesExt = 'png';

  static const splash = '$imagesPath/splash_screen.$imagesExt';

  static assetImg(
    String name, {
    Color color,
    double height,
    double width,
  }) {
    return _isImage(name)
        ? Image.asset(name, color: color, height: height, width: width)
        : SvgPicture.asset(name, color: color, height: height, width: width);
  }

  static bool _isImage(String name) {
    final ext = name.substring(name.length - 3);
    return ext == imagesExt;
  }
}
