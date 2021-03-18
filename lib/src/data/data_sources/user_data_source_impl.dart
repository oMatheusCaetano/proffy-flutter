import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;

import 'package:proffy/src/data/data_sources/contracts/user_data_source.dart';
import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/data/models/lesson.dart';
import 'package:proffy/src/domain/entities/enums.dart';
import 'package:proffy/src/domain/exceptions/form_data_exception.dart';
import 'package:proffy/utils/user_resolver.dart' as userResolver;
import 'package:proffy/utils/storage.dart' as storage;

class UserDataSourceImpl implements UserDataSource {
  final firebaseAuth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  UserDataSourceImpl(this._firebaseAuth, this._firestore);

  @override
  Future<dynamic> create(AuthUser user, UserType type) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      user.uid = userCredential.user.uid;
      final newUser = userResolver.userSpecificationFromUser(user, type);

      await this._firestore.collection('users').doc(newUser.uid).set(
            newUser.toJson(),
          );
      return newUser;
    } on firebaseAuth.FirebaseAuthException catch (exception) {
      throw FormDataException(exception.message);
    }
  }

  @override
  Future<void> addFavorite(Lesson lesson) async {
    String userUid = await storage.read(storage.loggedUserUid);
    final user = await getUserMapfromUid(userUid);
    if (!user['favoriteLessonsIds'].contains(lesson.uid)) {
      user['favoriteLessonsIds'] = user['favoriteLessonsIds']..add(lesson.uid);
      await this._firestore.collection('users').doc(userUid).update(user);
    }
  }

  @override
  Future<void> removeFavorite(Lesson lesson) async {
    String userUid = await storage.read(storage.loggedUserUid);
    final user = await getUserMapfromUid(userUid);
    if (user['favoriteLessonsIds'].contains(lesson.uid)) {
      user['favoriteLessonsIds'] = user['favoriteLessonsIds']
        ..remove(lesson.uid);
      await this._firestore.collection('users').doc(userUid).update(user);
    }
  }

  Future<Map<String, dynamic>> getUserMapfromUid(String uid) async {
    final teacherSnapshot =
        await this._firestore.collection('users').doc(uid).get();
    return teacherSnapshot.data();
  }
}
