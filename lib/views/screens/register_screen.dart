import 'package:flutter/material.dart';
import 'package:musix_app/utils/Size.dart';
import 'package:musix_app/utils/Theme.dart';
import 'package:musix_app/views/screens/login_screen.dart';
import 'package:musix_app/views/widgets/button_rounded.dart';
import 'package:musix_app/views/widgets/custom_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: SizeUtil.height(context),
          width: SizeUtil.width(context),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                right: 0,
                child: Image.asset('assets/images/bg_reg.png'),
              ),
              Container(
                height: SizeUtil.height(context) * 0.75,
                width: SizeUtil.width(context) * 0.80,
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
                        'Daftar',
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
                        height: SizeUtil.height(context) * 0.03,
                      ),
                      const CustomInput(
                        hint: 'Your password',
                        secure: true,
                      ),
                      SizedBox(
                        height: SizeUtil.height(context) * 0.03,
                      ),
                      const CustomInput(
                        hint: 'Your password',
                        secure: true,
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
                            'Sudah punya akun ? ',
                            style: TextStyle(
                              color: Pallete.secondary,
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            ),
                            child: Text(
                              'Masuk',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
