import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:musix_app/services/firebase_client.dart';

class AuthProvider extends ChangeNotifier {
  final google = GoogleSignIn();
  // state definition
  bool _loading = false;
  //
  User? _user;

  GoogleSignInAccount? _account;

  // getter state user
  User get user => _user!;
  // getter state loading
  bool get loading => _loading;
  // getter state account
  GoogleSignInAccount get account => _account!;

  // setter state loading
  void setLoading(bool status) {
    _loading = status;
    notifyListeners();
  }

  // setter state user
  void setUser(User user) {
    _user = user;
  }

  Future signInWithGoogle() async {
    try {
      var authenticate = await google.signIn();

      if (authenticate == null) return;

      _account = authenticate;

      final googleAuth = await authenticate.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseClient.auth.signInWithCredential(credential);

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> googleLogout() async {
    try {
      await google.disconnect();
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}
