import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musix_app/provider/auth_provider.dart';
import 'package:musix_app/services/firebase_client.dart';
import 'package:musix_app/utils/Redirect.dart';
import 'package:musix_app/utils/Size.dart';
import 'package:musix_app/utils/Theme.dart';
import 'package:musix_app/views/screens/register_screen.dart';
import 'package:musix_app/views/widgets/button_rounded.dart';
import 'package:musix_app/views/widgets/custom_input.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  Function() callbackLogin(AuthProvider provider, BuildContext context) {
    return () async {
      try {
        provider.setLoading(true);
        validate();
        await FirebaseClient.login(emailC.text, passwordC.text);
        provider.setLoading(false).setUser();
        Redirect.switchTo(context, '/home');
      } catch (e) {
        provider.setLoading(false);
        hanldeError(context, e.toString().split('Exception: ')[1]);
      }
    };
  }

  void validate() {
    if (emailC.text.isEmpty && passwordC.text.isEmpty) {
      throw Exception('email and password cant be blank');
    }
  }

  void hanldeError(BuildContext context, String message) {
    var snack = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red[600],
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AuthProvider>(
        create: (context) => AuthProvider(),
        child: Consumer<AuthProvider>(
          builder: (context, loading, child) => SingleChildScrollView(
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
                            CustomInput(
                              controller: emailC,
                              hint: 'youremail@example.com',
                            ),
                            SizedBox(
                              height: SizeUtil.height(context) * 0.03,
                            ),
                            CustomInput(
                              controller: passwordC,
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
                            RoundedButton(
                              child: loading.loading
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Masuk",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                              press: callbackLogin(loading, context),
                            ),
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
                                      builder: (context) =>
                                          const RegisterScreen(),
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
        ),
      ),
    );
  }
}
