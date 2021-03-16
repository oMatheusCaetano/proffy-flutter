import 'package:proffy/src/data/data_sources/contracts/auth_user_data_source.dart';
import 'package:proffy/src/data/models/user.dart';

class AuthUserDataSourceImpl implements AuthUserDataSource {
  Future<User> getCurrentUser() {
    // return Future.value(User(
    //   name: 'User Test',
    //   email: 'email@test.com',
    //   profilePhoto: 'https://thispersondoesnotexist.com/image',
    // ));
    return null;
  }
}
