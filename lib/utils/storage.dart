import 'package:get_storage/get_storage.dart';

final _box = GetStorage();

const userType = 'userType';
const isNotFirstTimeAccess = 'isNotFirstTimeAccess';

Future<bool> init() => GetStorage.init();

Future<void> write(String key, dynamic value) => _box.write(key, value);

Future<dynamic> read(String key) => Future.value(_box.read(key));

Future<bool> has(String key) => Future.value(_box.hasData(key));

Future<void> delete(String key) => _box.remove(key);

Future<void> destroy() => _box.erase();
