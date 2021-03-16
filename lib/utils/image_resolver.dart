import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const imagesPath = 'assets/img';
const imagesExt = 'png';

const iconsPath = 'assets/images/svg';
const iconsExt = 'svg';

const splash = '$imagesPath/splash_screen.$imagesExt';

const logo = '$iconsPath/logo.$iconsExt';
const hero = '$iconsPath/hero.$iconsExt';
const filter = '$iconsPath/filter.$iconsExt';
const whatsapp = '$iconsPath/whatsapp.$iconsExt';
const heart = '$iconsPath/heart.$iconsExt';
const heartOutlined = '$iconsPath/heart-outlined.$iconsExt';
const study = '$iconsPath/study.$iconsExt';
const giveClasses = '$iconsPath/give-classes.$iconsExt';
const rightArrow = '$iconsPath/right-arrow.$iconsExt';
const backgroundBubbles = '$iconsPath/background-bubbles.$iconsExt';

assetImg(String name, {Color color, double height, double width}) {
  return _isImage(name)
      ? Image.asset(name, color: color, height: height, width: width)
      : SvgPicture.asset(name, color: color, height: height, width: width);
}

bool _isImage(String name) {
  final ext = name.substring(name.length - 3);
  return ext == imagesExt;
}
