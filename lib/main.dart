import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:proffy/src/view/proffy.dart';
import 'package:proffy/utils/env.dart' as env;
import 'package:proffy/utils/storage.dart' as storage;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await env.init();
  await storage.init();
  runApp(Proffy());
}
