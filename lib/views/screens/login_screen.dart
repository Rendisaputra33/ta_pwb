import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musix_app/utils/Size.dart';
import 'package:musix_app/utils/Theme.dart';
import 'package:musix_app/views/screens/register_screen.dart';
import 'package:musix_app/views/widgets/button_rounded.dart';
import 'package:musix_app/views/widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Pallete.primary,
          height: SizeUtil.height(context),
          width: SizeUtil.width(context),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: -1,
                right: 0,
                child: SvgPicture.asset(
                  "assets/images/bg.svg",
                  height: SizeUtil.height(context) * 0.85,
                ),
              ),
              Positioned(
                top: 37,
                right: 30,
                child: SvgPicture.asset(
                  "assets/images/amico.svg",
                  width: 170,
                  height: 170,
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
                        Text(
                          'Masuk',
                          style: TextStyle(
                            color: Pallete.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(
                          height: SizeUtil.height(context) * 0.06,
                        ),
                        const CustomInput(
                          hint: 'youremail@example.com',
                        ),
                        SizedBox(
                          height: SizeUtil.height(context) * 0.03,
                        ),
                        const CustomInput(
                          hint: 'Your password',
                          secure: true,
                        ),
                        SizedBox(
                          height: SizeUtil.height(context) * 0.016,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Lupa kata sandi ? ',
                              style: TextStyle(
                                color: Pallete.primary,
                                // fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeUtil.height(context) * 0.03,
                        ),
                        const RoundedButton(),
                        SizedBox(
                          height: SizeUtil.height(context) * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Belum punya akun ? ',
                              style: TextStyle(
                                color: Pallete.secondary,
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              ),
                              child: Text(
                                'Daftar',
                                style: TextStyle(
                                  color: Pallete.primary,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
