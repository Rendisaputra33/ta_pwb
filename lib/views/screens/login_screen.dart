import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musix_app/utils/Size.dart';
import 'package:musix_app/utils/Theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Pallete.primary,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: -1,
              right: 0,
              child: Image.asset(
                "assets/images/background.png",
              ),
            ),
            Positioned(
              top: 35,
              right: 35,
              child: SvgPicture.asset(
                "assets/images/amico.svg",
                width: 150,
                height: 150,
              ),
            ),
            Positioned(
              bottom: SizeUtil.height(context) * 0.15,
              child: Container(
                height: SizeUtil.height(context) * 0.55,
                width: SizeUtil.width(context) * 0.85,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x54000000),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: SizeUtil.height(context) * 0.10,
                        child: TextField(),
                      ),
                    ],
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
