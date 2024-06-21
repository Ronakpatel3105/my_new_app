import 'package:firebase_auth/firebase_auth.dart';


class AuthRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;



  Future<void> signUp({required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (_) {}
  }

  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (_) {}
  }

  Future<void> logout() async {
    try {
      await Future.wait([firebaseAuth.signOut()]);
    } catch (_) {}
  }
}



