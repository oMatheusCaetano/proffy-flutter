import 'package:flutter_dotenv/flutter_dotenv.dart' as env;

final fileName = '.env';

Future<dynamic> init() => env.load(fileName: fileName);

String get appName => env.env['APP_NAME'];
