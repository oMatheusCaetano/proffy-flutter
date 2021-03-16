import 'package:get/get.dart';

import 'package:proffy/utils/storage.dart' as storage;
import 'package:proffy/router/router.dart' as router;

class AppLoaderPageController extends GetxController {
  Future<void> _handleFirstTimeAccessCheck() async {
    await storage.has('isNotFirstTimeAccess')
        ? this._handleAuthenticationCheck()
        : router.offNamed(router.OnBoarding);
  }

  void _handleAuthenticationCheck() {
    true == true //! TODO: Add user is authenticated validation
        ? router.offNamed(router.Login)
        : router.offNamed(router.Study);
  }

  @override
  void onInit() {
    this._handleFirstTimeAccessCheck();
    super.onInit();
  }
}
