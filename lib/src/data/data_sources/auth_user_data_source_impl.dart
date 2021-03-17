import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;

import 'package:proffy/src/data/data_sources/contracts/auth_user_data_source.dart';
import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/data/models/user.dart';
import 'package:proffy/src/domain/exceptions/form_data_exception.dart';

class AuthUserDataSourceImpl implements AuthUserDataSource {
  final firebaseAuth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  AuthUserDataSourceImpl(this._firebaseAuth, this._firestore);

  Future<User> login(AuthUser user) async {
    try {
      final credentials = await this._firebaseAuth.signInWithEmailAndPassword(
            email: user.email,
            password: user.password,
          );

      return _getUserfromUid(credentials.user.uid);
    } on firebaseAuth.FirebaseAuthException catch (exception) {
      throw FormDataException(exception.message);
    }
  }

  Future<User> getCurrentUser() async {
    final currentUser = this._firebaseAuth.currentUser;
    return currentUser == null ? null : _getUserfromUid(currentUser.uid);
  }

  Future<User> _getUserfromUid(String uid) async {
    final userData = await this._firestore.collection('users').doc(uid).get();
    return User.fromJson(userData.data());
  }
}
