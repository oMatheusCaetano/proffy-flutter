import 'package:flutter/material.dart';
import 'package:proffy/src/view/utils/pallete.dart';

mixin InputStyles {
  TextStyle labelStyle(bool lightBackground) {
    return TextStyle(
      color: lightBackground ? Pallete.primary : Pallete.placeholder,
      fontSize: 12,
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      fillColor: Pallete.inputBackground,
      focusColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      filled: true,
    );
  }
}
