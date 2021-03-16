import 'package:flutter_dotenv/flutter_dotenv.dart' as env;

final file = '.env';

Future<dynamic> loadEnvironmentVariables() async => env.load(fileName: file);

String get appName => env.env['APP_NAME'];
