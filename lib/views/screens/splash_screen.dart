import 'package:flutter/material.dart';
import 'package:musix_app/services/firebase_client.dart';
import 'package:musix_app/utils/Redirect.dart';
import 'package:musix_app/utils/Size.dart';
import 'package:musix_app/utils/Theme.dart';
// import 'package:musix_app/views/screens/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseClient.getStreamAuth.listen((event) {
      if (event == null) {
        Redirect.switchTo(context, '/start');
      } else {
        Redirect.switchTo(context, '/home');
      }
    });
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
