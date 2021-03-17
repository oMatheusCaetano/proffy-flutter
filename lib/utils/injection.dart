import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:proffy/src/data/data_sources/auth_user_data_source_impl.dart';
import 'package:proffy/src/data/data_sources/contracts/auth_user_data_source.dart';
import 'package:proffy/src/data/data_sources/contracts/lesson_data_source.dart';
import 'package:proffy/src/data/data_sources/contracts/subject_data_source.dart';
import 'package:proffy/src/data/data_sources/contracts/user_data_source.dart';
import 'package:proffy/src/data/data_sources/lesson_data_source_impl.dart';
import 'package:proffy/src/data/data_sources/subject_data_source_impl.dart';
import 'package:proffy/src/data/data_sources/user_data_source_impl.dart';
import 'package:proffy/src/data/repositories/auth_user_repository_impl.dart';
import 'package:proffy/src/data/repositories/lesson_repository_impl.dart';
import 'package:proffy/src/data/repositories/subject_repository_impl.dart';
import 'package:proffy/src/data/repositories/user_repository_impl.dart';
import 'package:proffy/src/domain/repositories/auth_user_repository.dart';
import 'package:proffy/src/domain/repositories/lesson_repository.dart';
import 'package:proffy/src/domain/repositories/subject_repository.dart';
import 'package:proffy/src/domain/repositories/user_repository.dart';
import 'package:proffy/src/view/controllers/app_loader_page_controller.dart';
import 'package:proffy/src/view/controllers/home_page_controller.dart';
import 'package:proffy/src/view/controllers/login_page_controller.dart';
import 'package:proffy/src/view/controllers/on_boarding_page_controller.dart';
import 'package:proffy/src/view/controllers/register_page_controller.dart';
import 'package:proffy/src/view/controllers/study_page_controller.dart';

class Injection implements Bindings {
  static S find<S>() => Get.find<S>();

  @override
  void dependencies() {
    //! External packages
    Get.put<FirebaseAuth>(FirebaseAuth.instance);
    Get.put<FirebaseFirestore>(FirebaseFirestore.instance);

    //! Data sources
    Get.put<AuthUserDataSource>(AuthUserDataSourceImpl(Get.find(), Get.find()));
    Get.put<UserDataSource>(UserDataSourceImpl(Get.find(), Get.find()));
    Get.put<LessonDataSource>(LessonDataSourceImpl());
    Get.put<SubjectDataSource>(SubjectDataSourceImpl());

    //! Repositories
    Get.put<AuthUserRepository>(AuthUserRepositoryImpl(Get.find()));
    Get.put<UserRepository>(UserRepositoryImpl(Get.find()));
    Get.put<LessonRepository>(LessonRepositoryImpl(Get.find()));
    Get.put<SubjectRepository>(SubjectRepositoryImpl(Get.find()));

    //! Controllers
    Get.put<AppLoaderPageController>(AppLoaderPageController(Get.find()));
    Get.put<LoginPageController>(LoginPageController(Get.find()));
    Get.put<HomePageController>(HomePageController());
    Get.put<OnBoardingPageController>(OnBoardingPageController());
    Get.put<StudyPageController>(StudyPageController(Get.find(), Get.find()));
    Get.put<RegisterPageController>(RegisterPageController(
      Get.find(),
      Get.find(),
    ));
  }
}
