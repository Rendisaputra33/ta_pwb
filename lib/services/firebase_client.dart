import 'package:firebase_auth/firebase_auth.dart';

class FirebaseClient {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Stream<User?> get getStreamAuth => auth.authStateChanges();

  static Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}
