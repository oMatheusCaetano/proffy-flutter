import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:proffy/src/data/models/lesson.dart';
import 'package:proffy/src/data/models/subject.dart';
import 'package:proffy/src/domain/repositories/lesson_repository.dart';
import 'package:proffy/src/domain/repositories/subject_repository.dart';
import 'package:proffy/src/domain/repositories/user_repository.dart';

class StudyPageController extends GetxController {
  final LessonRepository _lessonRepository;
  final UserRepository _userRepository;
  final SubjectRepository _subjectRepository;

  final screenIndex = 0.obs;
  final lessons = <Lesson>[].obs;
  final favorites = <Lesson>[].obs;
  final subjects = <Subject>[].obs;
  final RxMap<String, String> filters = {'subject': '', 'weekDay': ''}.obs;

  final pageController = PageController();

  StudyPageController(
    this._lessonRepository,
    this._subjectRepository,
    this._userRepository,
  );

  void changeScreenIndex(int index) => this.screenIndex.value = index;
  bool isCurrentScreen(int index) => this.screenIndex.value == index;

  void changeScreen(int index, Duration duration, Curve curve) {
    pageController.animateToPage(index, duration: duration, curve: curve);
    changeScreenIndex(index);
  }

  Future<void> getLessons() async {
    lessons.assignAll(await this._lessonRepository.getAll(this.filters));
  }

  Future<void> updateLesson(Lesson lesson) async {
    this.isFavorite(lesson)
        ? await this._userRepository.removeFavorite(lesson)
        : await this._userRepository.addFavorite(lesson);
    lessons.assignAll(await this._lessonRepository.getAll(this.filters));
    favorites.assignAll(await this._lessonRepository.getFavorites());
  }

  Future<void> _getFavorites() async {
    favorites.assignAll(await this._lessonRepository.getFavorites());
  }

  Future<void> _getSubjects() async {
    subjects.assignAll(await this._subjectRepository.getAll());
  }

  bool isFavorite(Lesson lesson) {
    for (var item in favorites) {
      if (item.uid == lesson.uid) return true;
    }
    return false;
  }

  @override
  Future<void> onInit() async {
    await this.getLessons();
    await this._getSubjects();
    await _getFavorites();
    super.onInit();
  }
}
