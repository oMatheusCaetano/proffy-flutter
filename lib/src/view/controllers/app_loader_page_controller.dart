import 'package:get/get.dart';

import 'package:proffy/src/domain/repositories/auth_user_repository.dart';
import 'package:proffy/utils/storage.dart' as storage;
import 'package:proffy/router/router.dart' as router;

class AppLoaderPageController extends GetxController {
  final AuthUserRepository _authUserRepository;

  AppLoaderPageController(this._authUserRepository);

  Future<void> _handleFirstTimeAccessCheck() async {
    if (await storage.has(storage.isNotFirstTimeAccess))
      this._handleAuthenticationCheck();
    else {
      await storage.write(storage.isNotFirstTimeAccess, true);
      router.offNamed(router.OnBoarding);
    }
  }

  void _handleAuthenticationCheck() async {
    if (await this._authUserRepository.getCurrentUser() != null)
      router.offAllNamed(router.Study);
    else {
      await storage.delete(storage.loggedUserUid);
      this._handleUserTypeCheck();
    }
  }

  Future<void> _handleUserTypeCheck() async {
    final type = await storage.read(storage.userType);
    type == null
        ? router.offAllNamed(router.Home)
        : router.offAllNamed(router.Login, [type]);
  }

  @override
  void onInit() {
    this._handleFirstTimeAccessCheck();
    super.onInit();
  }
}
