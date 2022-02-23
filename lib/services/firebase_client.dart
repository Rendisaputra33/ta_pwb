import 'package:firebase_auth/firebase_auth.dart';

class FirebaseClient {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Stream<User?> get getStreamAuth => auth.authStateChanges();

  static void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: 'myacc@gmail.com', password: '123123');
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}
