import 'package:flutter/material.dart';
import 'package:proffy/src/view/utils/pallete.dart';

mixin StudyBottomNavigationBarStyles {
  BoxDecoration containerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border(top: BorderSide(width: 1, color: Pallete.textInPrimary)),
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      overlayColor: MaterialStateProperty.all(Pallete.primary.withOpacity(.1)),
    );
  }

  TextStyle buttonTextStyle(bool selected) {
    return TextStyle(
      color: selected ? Pallete.title : Pallete.text,
      fontWeight: selected ? FontWeight.bold : FontWeight.normal,
      fontSize: 13,
    );
  }
}
