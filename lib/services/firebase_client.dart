import 'package:firebase_auth/firebase_auth.dart';

class FirebaseClient {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Stream<User?> get getStreamAuth => auth.authStateChanges();

  static Future<UserCredential> login(String email, String password) async {
    try {
      final data = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return data;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<void> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }
}
