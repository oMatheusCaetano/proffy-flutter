import 'package:get/get.dart';

import 'package:proffy/src/domain/repositories/auth_user_repository.dart';
import 'package:proffy/router/router.dart' as router;
import 'package:proffy/utils/storage.dart' as storage;

class AppDrawerController extends GetxController {
  final AuthUserRepository _authUserRepository;

  AppDrawerController(this._authUserRepository);

  Future<void> logout() async {
    await this._authUserRepository.logout();
    await storage.delete(storage.loggedUserUid);
    final userType = await storage.read(storage.userType);
    router.offAllNamed(router.Login, [userType]);
  }
}
