import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musix_app/views/screens/splash_screen.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.white,
  //     statusBarBrightness: Brightness.dark,
  //     statusBarIconBrightness: Brightness.dark,
  //   ),
  // );
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
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: 'Poppins'),
      home: const SplashScreen(),
    );
  }
}
