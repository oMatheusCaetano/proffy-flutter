import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;

import 'package:proffy/src/data/data_sources/contracts/auth_user_data_source.dart';
import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/data/models/user.dart';
import 'package:proffy/src/domain/exceptions/form_data_exception.dart';
import 'package:proffy/utils/user_resolver.dart' as userResolver;

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

  Future<dynamic> getCurrentUser() async {
    final currentUser = this._firebaseAuth.currentUser;
    return currentUser == null ? null : _getUserfromUid(currentUser.uid);
  }

  Future<dynamic> _getUserfromUid(String uid) async {
    final snapshot = await this._firestore.collection('users').doc(uid).get();
    final userData = snapshot.data();

    return userResolver.userSpecificationFromType(
      userResolver.userTypeStringtoUserType(userData['type']),
      userData,
    );
  }

  Future<void> logout() => this._firebaseAuth.signOut();
}
