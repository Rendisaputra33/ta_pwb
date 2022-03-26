import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:musix_app/utils/Redirect.dart';
import 'package:musix_app/utils/Size.dart';
import 'package:musix_app/utils/Theme.dart';
// import 'package:musix_app/views/screens/start_screen.dart';

class SplashScreen extends StatefulWidget {
  final bool isAuth;
  const SplashScreen({Key? key, required this.isAuth}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (widget.isAuth) {
        // SchedulerBinding.instance?.addPostFrameCallback((_) {
        Redirect.switchTo(context, '/home', replace: true);
        // });
      } else {
        // SchedulerBinding.instance?.addPostFrameCallback((_) {
        Redirect.switchTo(context, '/start', replace: true);
        // });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: SizeUtil.height(context),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 10,
              child: Center(
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: Text(
                  "Grf4music",
                  style: TextStyle(
                    color: Pallete.primary,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
