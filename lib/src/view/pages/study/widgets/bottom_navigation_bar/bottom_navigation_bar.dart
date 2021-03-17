import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/view/controllers/study_page_controller.dart';
import 'package:proffy/src/view/pages/study/widgets/bottom_navigation_bar/styles.dart';
import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/utils/image_resolver.dart' as image;
import 'package:proffy/utils/injection.dart';

class StudyBottomNavigationBar extends StatelessWidget
    with StudyBottomNavigationBarStyles {
  final controller = Injection.find<StudyPageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerDecoration(),
      height: 56,
      width: double.infinity,
      child: Obx(
        () => Row(
          children: [
            _buildButton(
                index: 0,
                icon: image.study,
                label: 'Proffys',
                iconsHeight: 22,
                selected: controller.isCurrentScreen(0)),
            _buildButton(
                index: 1,
                icon: image.heartOutlined,
                label: 'Favoritos',
                selected: controller.isCurrentScreen(1)),
          ],
        ),
      ),
    );
  }

  Expanded _buildButton({
    int index,
    String icon,
    String label,
    bool selected = false,
    double iconsHeight = 16,
  }) {
    return Expanded(
      child: Container(
        height: 56,
        color: selected ? Pallete.background : Colors.transparent,
        child: TextButton(
          style: buttonStyle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image.assetImg(
                icon,
                color: selected ? Pallete.primary : Pallete.text,
                height: iconsHeight,
              ),
              SizedBox(width: 15),
              Text(label, style: buttonTextStyle(selected)),
            ],
          ),
          onPressed: () => controller.changeScreen(
            index,
            Duration(milliseconds: 300),
            Curves.linear,
          ),
        ),
      ),
    );
  }
}
