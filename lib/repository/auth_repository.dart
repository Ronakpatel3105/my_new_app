import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../model/users.dart';
import '../model/users.dart';
import '../model/users.dart';

class AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  AuthRepository({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;
  var currentUser;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
    });
  }

  Future<void> signUp({required String email, required String password}) {}

  Future<void> loginwithEmailandPassword(
      {required String email, required String password}) {}

  Future<void> logout() async {}
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}
