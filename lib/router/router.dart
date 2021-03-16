import 'package:get/get.dart';

import 'package:proffy/src/view/pages/app_loader/app_loader_page.dart';
import 'package:proffy/src/view/pages/home/home_page.dart';
import 'package:proffy/src/view/pages/login/login_page.dart';
import 'package:proffy/src/view/pages/on_boarding/on_boarding_page.dart';
import 'package:proffy/src/view/pages/study/study_page.dart';

part 'routes.dart';

toNamed(String page, [List args]) {
  String path = '$page';
  args?.forEach((arg) => path += '/$arg');
  Get.toNamed(path, arguments: args);
}

offNamed(String page, [List args]) {
  String path = '$page';
  args?.forEach((arg) => path += '/$arg');
  Get.offNamed(path, arguments: args);
}

offAllNamed(String page, [List args]) {
  String path = '$page';
  args?.forEach((arg) => path += '/$arg');
  Get.offAllNamed(path, arguments: args);
}
