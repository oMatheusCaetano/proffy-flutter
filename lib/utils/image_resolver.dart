import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const imagesPath = 'assets/img';
const imagesExt = 'png';
const splash = '$imagesPath/splash_screen.$imagesExt';

assetImg(String name, {Color color, double height, double width}) {
  return _isImage(name)
      ? Image.asset(name, color: color, height: height, width: width)
      : SvgPicture.asset(name, color: color, height: height, width: width);
}

bool _isImage(String name) {
  final ext = name.substring(name.length - 3);
  return ext == imagesExt;
}
