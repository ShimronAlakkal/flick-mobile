import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth authInstance = FirebaseAuth.instance;

  // user sign up
  Future<String> signUserUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential creds = await authInstance.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return e.toString();
    }
    return '1';
  }

  // user sign in method
  Future<String> signUserInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential creds = await authInstance.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      return e.toString();
    }
    return '1';
  }
}
