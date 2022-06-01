import 'package:flutter/material.dart';
import 'package:musix_app/views/screens/main_layout.dart';
import 'package:musix_app/views/screens/login_screen.dart';
import 'package:musix_app/views/screens/register_screen.dart';
import 'package:musix_app/views/screens/start_screen.dart';

var routes = <String, Widget>{
  '/home': const MainLayout(),
  '/login': const LoginScreen(),
  '/register': const RegisterScreen(),
  '/start': const StartScreen()
};

class Redirect {
  static dynamic switchTo(BuildContext context, String name, {bool? replace}) {
    if (replace != null) {
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => routes[name]!));
    }
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => routes[name]!));
  }
}
