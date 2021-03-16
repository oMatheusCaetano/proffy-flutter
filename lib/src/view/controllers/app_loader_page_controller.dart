import 'package:get/get.dart';

import 'package:proffy/src/domain/repositories/auth_user_repository.dart';
import 'package:proffy/utils/storage.dart' as storage;
import 'package:proffy/router/router.dart' as router;

class AppLoaderPageController extends GetxController {
  final AuthUserRepository _authUserRepository;

  AppLoaderPageController(this._authUserRepository);

  Future<void> _handleFirstTimeAccessCheck() async {
    final isNotFirstTimeAccess = 'isNotFirstTimeAccess';

    await storage.delete(
      isNotFirstTimeAccess,
    ); //! Remove once OnBoadingPage is completed

    if (await storage.has(isNotFirstTimeAccess))
      this._handleAuthenticationCheck();
    else {
      await storage.write(isNotFirstTimeAccess, true);
      router.offNamed(router.OnBoarding);
    }
  }

  void _handleAuthenticationCheck() {
    this._authUserRepository.getCurrentUser() == null
        ? router.offAllNamed(router.Login)
        : router.offAllNamed(router.Study);
  }

  @override
  void onInit() {
    this._handleFirstTimeAccessCheck();
    super.onInit();
  }
}
