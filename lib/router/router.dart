import 'package:get/get.dart';

import 'package:proffy/src/view/pages/app_loader/app_loader_page.dart';
import 'package:proffy/src/view/pages/home/home_page.dart';
import 'package:proffy/src/view/pages/login/login_page.dart';
import 'package:proffy/src/view/pages/on_boarding/on_boarding_page.dart';
import 'package:proffy/src/view/pages/profile/profile_page.dart';
import 'package:proffy/src/view/pages/register/register_page.dart';
import 'package:proffy/src/view/pages/study/study_page.dart';

part 'routes.dart';

Map<String, String> get params => Get.parameters;

toNamed(String page, [List args]) {
  Get.toNamed(_bindPathParameters(page, args), arguments: args);
}

offNamed(String page, [List args]) {
  Get.offNamed(_bindPathParameters(page, args), arguments: args);
}

offAllNamed(String page, [List args]) {
  Get.offAllNamed(_bindPathParameters(page, args), arguments: args);
}

String _bindPathParameters(String page, [List args]) {
  String path = '$page';
  args?.forEach((arg) => path += '/$arg');
  return path;
}
