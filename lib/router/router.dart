import 'package:get/get.dart';
import 'package:proffy/src/view/pages/app_loader/app_loader_page.dart';
import 'package:proffy/src/view/pages/login/login_page.dart';
import 'package:proffy/src/view/pages/on_boarding/on_boarding_page.dart';
import 'package:proffy/src/view/pages/study/study_page.dart';

part 'routes.dart';

offNamed(String page, {args}) => Get.offNamed(page, arguments: args);
