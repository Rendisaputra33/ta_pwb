import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musix_app/services/firebase_client.dart';
import 'package:musix_app/views/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final User? user = FirebaseAuth.instance.currentUser;
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: StreamBuilder<User?>(
        stream: FirebaseClient.getStreamAuth,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return SplashScreen(isAuth: (snapshot.data != null));
          } else {
            return const Center(
              child: CircularProgressIndicator(color: Colors.purple),
            );
          }
        },
      ),
    );
  }
}
