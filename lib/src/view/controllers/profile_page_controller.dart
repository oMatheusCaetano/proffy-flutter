import 'package:get/get.dart';
import 'package:proffy/src/data/models/lesson.dart';
import 'package:proffy/src/data/models/subject.dart';

import 'package:proffy/src/domain/repositories/auth_user_repository.dart';
import 'package:proffy/src/domain/repositories/lesson_repository.dart';
import 'package:proffy/src/domain/repositories/subject_repository.dart';

class ProfilePageController extends GetxController {
  final AuthUserRepository _authUserRepository;
  final LessonRepository _lessonRepository;
  final SubjectRepository _subjectRepository;

  Rx<dynamic> user;
  final loading = false.obs;
  final subjects = <Subject>[].obs;
  final lessons = <Lesson>[].obs;

  ProfilePageController(
    this._authUserRepository,
    this._lessonRepository,
    this._subjectRepository,
  );

  Future<void> createOrUpdateLesson(Lesson lesson) async {
    this.loading.value = true;
    await this._lessonRepository.createOrUpdate(lesson);
    await loadLessons();
    this.loading.value = false;
  }

  Future<void> loadLessons() async {
    this
        .lessons
        .assignAll(await this._lessonRepository.fromTeacher(this.user.value));

    await _loadSubjects();
  }

  Future<void> _loadUserInfo() async {
    this.user = Rx(await this._authUserRepository.getCurrentUser());
  }

  Future<void> _loadSubjects() async {
    subjects.assignAll(await this._subjectRepository.getAll());
  }

  @override
  Future<void> onInit() async {
    this.loading.value = true;
    await this._loadUserInfo();
    this.loading.value = false;
    super.onInit();
  }
}
