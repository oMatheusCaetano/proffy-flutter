import 'package:proffy/src/data/data_sources/contracts/user_data_source.dart';
import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/data/models/lesson.dart';
import 'package:proffy/src/domain/entities/enums.dart';
import 'package:proffy/src/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<dynamic> create(AuthUser user, UserType type) {
    return this._dataSource.create(user, type);
  }

  Future<void> addFavorite(Lesson lesson) {
    return this._dataSource.addFavorite(lesson);
  }

  Future<void> removeFavorite(Lesson lesson) {
    return this._dataSource.removeFavorite(lesson);
  }
}
