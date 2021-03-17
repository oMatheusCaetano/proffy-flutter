import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/data/models/lesson.dart';
import 'package:proffy/src/data/models/subject.dart';
import 'package:proffy/src/domain/repositories/lesson_repository.dart';
import 'package:proffy/src/domain/repositories/subject_repository.dart';

class StudyPageController extends GetxController {
  final LessonRepository _lessonRepository;
  final SubjectRepository _subjectRepository;

  final screenIndex = 0.obs;
  final lessons = <Lesson>[].obs;
  final subjects = <Subject>[].obs;
  final RxMap<String, String> filters = {'subject': '', 'weekDay': ''}.obs;

  final pageController = PageController();

  StudyPageController(this._lessonRepository, this._subjectRepository);

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

  Future<void> filter() async {
    lessons.assignAll(await this._lessonRepository.getAll(this.filters));
  }

  @override
  Future<void> onInit() async {
    lessons.assignAll(await this._lessonRepository.getAll());
    subjects.assignAll(await this._subjectRepository.getAll());
    super.onInit();
  }
}
