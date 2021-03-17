import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;

import 'package:proffy/src/data/data_sources/contracts/user_data_source.dart';
import 'package:proffy/src/data/models/auth_user.dart';
import 'package:proffy/src/domain/entities/enums.dart';
import 'package:proffy/src/domain/exceptions/form_data_exception.dart';
import 'package:proffy/utils/user_resolver.dart' as userResolver;

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
}
