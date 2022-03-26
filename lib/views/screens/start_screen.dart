import 'package:flutter/material.dart';
import 'package:musix_app/provider/auth_provider.dart';
import 'package:musix_app/utils/Redirect.dart';
import 'package:musix_app/utils/Size.dart';
import 'package:musix_app/utils/Theme.dart';
import 'package:musix_app/views/widgets/button_rounded.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  void loginWithGoogle(AuthProvider provider, BuildContext context) async {
    try {
      await provider.signInWithGoogle();
      provider.setUser();
      Redirect.switchTo(context, '/home', replace: true);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

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
                    Center(
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    RoundedButton(
                      press: () => Redirect.switchTo(context, '/login'),
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
                      press: () => loginWithGoogle(authProvider, context),
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
