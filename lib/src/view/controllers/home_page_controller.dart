import 'package:get/get.dart';

import 'package:proffy/src/domain/entities/enums.dart';
import 'package:proffy/utils/storage.dart' as storage;
import 'package:proffy/router/router.dart' as router;

class HomePageController extends GetxController {
  void goToLoginPage(UserType type) {
    storage.write(storage.userType, type.toString());
    router.toNamed(router.Login, [type]);
  }
}
