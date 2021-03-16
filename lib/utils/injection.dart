import 'package:get/get.dart';

import 'package:proffy/src/data/data_sources/auth_user_data_source_impl.dart';
import 'package:proffy/src/data/data_sources/contracts/auth_user_data_source.dart';
import 'package:proffy/src/data/repositories/auth_user_repository_impl.dart';
import 'package:proffy/src/domain/repositories/auth_user_repository.dart';
import 'package:proffy/src/view/controllers/app_loader_page_controller.dart';
import 'package:proffy/src/view/controllers/on_boarding_page_controller.dart';

class Injection implements Bindings {
  static S find<S>() => Get.find<S>();

  @override
  void dependencies() {
    //! Data sources
    Get.put<AuthUserDataSource>(AuthUserDataSourceImpl());

    //! Repositories
    Get.put<AuthUserRepository>(AuthUserRepositoryImpl(Get.find()));

    //! Controllers
    Get.put<AppLoaderPageController>(AppLoaderPageController(Get.find()));
    Get.put<OnBoardingPageController>(OnBoardingPageController());
  }
}
