import 'package:flutter/material.dart';

import 'package:proffy/src/view/proffy.dart';
import 'package:proffy/utils/env.dart' as env;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await env.loadEnvironmentVariables();
  runApp(Proffy());
}
