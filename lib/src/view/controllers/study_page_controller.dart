import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/data/models/lesson.dart';
import 'package:proffy/src/domain/repositories/lesson_repository.dart';

class StudyPageController extends GetxController {
  final RxInt screenIndex = 0.obs;
  final RxList<Lesson> lessons = <Lesson>[].obs;

  final PageController pageController = PageController();
  final LessonRepository _lessonRepository;

  StudyPageController(this._lessonRepository);

  void changeScreenIndex(int index) => this.screenIndex.value = index;
  bool isCurrentScreen(int index) => this.screenIndex.value == index;

  void changeScreen(int index, Duration duration, Curve curve) {
    pageController.animateToPage(
      index,
      duration: duration,
      curve: curve,
    );
    changeScreenIndex(index);
  }

  @override
  Future<void> onInit() async {
    lessons.assignAll(await this._lessonRepository.getAll());
    super.onInit();
  }
}
