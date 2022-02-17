import 'package:flutter/material.dart';
import 'package:musix_app/utils/Size.dart';
import 'package:musix_app/utils/Theme.dart';
import 'package:musix_app/views/screens/login_screen.dart';
import 'package:musix_app/views/widgets/button_rounded.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          width: SizeUtil.width(context),
          height: SizeUtil.height(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 5,
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeUtil.height(context) * 0.20,
                    ),
                    Text(
                      'Selamat Datang',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Pallete.primary,
                        fontSize: 33,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Center(
                        child: Image.asset("assets/images/logo.png"),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    RoundedButton(
                      press: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Center(
                      child: Text(
                        "ATAU",
                        style: TextStyle(
                          color: Pallete.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    RoundedButton(
                      color: Colors.white,
                      border: const BorderSide(
                        color: Color(0xFF656363),
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/google.png",
                            width: 30,
                            height: 30,
                          ),
                          const Text(
                            "Masuk Dengan Google",
                            style: TextStyle(
                              color: Color(0xFF656363),
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Belum punya akun ? "),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Daftar",
                              style: TextStyle(
                                color: Pallete.primary,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
