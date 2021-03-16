import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/view/utils/pallete.dart';
import 'package:proffy/router/router.dart' as router;
import 'package:proffy/utils/image_resolver.dart' as image;

class OnBoardingPageController extends GetxController {
  final screenIndex = 0.obs;
  final pageController = PageController();
  final List<Map> screenData = [
    {
      'number': 1,
      'message1': 'Encontre vários',
      'message2': 'professores para',
      'message3': 'ensinar você.',
      'color': Pallete.primary,
      'image': image.study,
    },
    {
      'number': 2,
      'message1': 'Ou dê aulas',
      'message2': 'sobre o que você',
      'message3': 'mais conhece.',
      'color': Pallete.secondary,
      'image': image.giveClasses,
    },
  ];

  void changeScreenIndex(int index) => this.screenIndex.value = index;
  bool isCurrentScreen(int index) => this.screenIndex.value == index;

  void handleNextPage(Duration duration, Curve curve) {
    if (screenIndex.value == screenData.length - 1)
      router.offNamed(router.Home);
    else
      pageController.animateToPage(
        ++screenIndex.value,
        duration: duration,
        curve: curve,
      );
  }
}
