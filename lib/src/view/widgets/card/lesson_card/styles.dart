import 'package:flutter/material.dart';
import 'package:proffy/src/view/utils/pallete.dart';

mixin LessonCardStyles {
  BoxDecoration containerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Pallete.placeholder,
        width: 1,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );
  }

  BoxDecoration footerContainerDecoration() {
    return BoxDecoration(
      color: Pallete.inputBackground.withOpacity(.5),
      border: Border(
        top: BorderSide(width: 1, color: Pallete.placeholder),
      ),
    );
  }
}
