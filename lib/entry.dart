import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musix_app/provider/auth_provider.dart';
import 'package:musix_app/services/firebase_client.dart';
import 'package:musix_app/views/screens/splash_screen.dart';
import 'package:provider/provider.dart';

class EntryApp extends StatelessWidget {
  const EntryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseClient.getStreamAuth,
          builder: (context, snapshot) {
            final authProvider = Provider.of<AuthProvider>(context);

            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data != null) {
                authProvider.setUser(snapshot.data!);
              }

              return SplashScreen(isAuth: (snapshot.data != null));
              // when waitinf
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                color: Colors.white,
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.purple),
                ),
              );
            } else {
              return Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    'Error please check connection internet',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              );
            }
          },
        ),
      );
}
