import 'package:get/get.dart';
import 'package:proffy/src/view/controllers/app_loader_page_controller.dart';

class Injection implements Bindings {
  static S find<S>() => Get.find<S>();

  @override
  void dependencies() {
    //! Controllers
    Get.put<AppLoaderPageController>(AppLoaderPageController());
  }
}
