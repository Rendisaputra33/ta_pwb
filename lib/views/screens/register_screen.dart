import 'package:flutter/material.dart';
import 'package:musix_app/provider/auth_provider.dart';
import 'package:musix_app/services/firebase_client.dart';
import 'package:musix_app/utils/Size.dart';
import 'package:musix_app/utils/Theme.dart';
import 'package:musix_app/views/screens/login_screen.dart';
import 'package:musix_app/views/widgets/button_rounded.dart';
import 'package:musix_app/views/widgets/custom_input.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController uC = TextEditingController();
  final TextEditingController eC = TextEditingController();
  final TextEditingController pC = TextEditingController();
  final TextEditingController cC = TextEditingController();

  Function() handleSubmit(BuildContext context, AuthProvider loading) {
    return () async {
      try {
        loading.setLoading(true);
        validateForm();
        await FirebaseClient.register(eC.text, pC.text);
        loading.setLoading(false);
      } on Exception catch (e) {
        loading.setLoading(false);
        hanldeError(context, e.toString().split('Exception: ')[1]);
      }
    };
  }

  void hanldeError(BuildContext context, String message) {
    var snack = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red[600],
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  void validateForm() {
    if (uC.text.isEmpty &&
        eC.text.isEmpty &&
        pC.text.isEmpty &&
        cC.text.isEmpty) {
      throw Exception('field cant blank');
    }
    // else if (pC.text == cC.text) {
    //   throw Exception('password conformation dost match');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AuthProvider>(
        create: (context) => AuthProvider(),
        child: Consumer<AuthProvider>(
          builder: (context, loading, child) => SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: SizeUtil.height(context),
              width: SizeUtil.width(context),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 25,
                    right: 0,
                    child: Image.asset('assets/images/bg_reg.png'),
                  ),
                  Container(
                    height: SizeUtil.height(context) * 0.75,
                    width: SizeUtil.width(context) * 0.87,
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
                          CustomInput(
                            hint: 'username_domain',
                            controller: uC,
                          ),
                          SizedBox(
                            height: SizeUtil.height(context) * 0.03,
                          ),
                          CustomInput(
                            hint: 'youremail@example.com',
                            controller: eC,
                          ),
                          SizedBox(
                            height: SizeUtil.height(context) * 0.03,
                          ),
                          CustomInput(
                            hint: 'Your Password',
                            controller: pC,
                            secure: true,
                          ),
                          SizedBox(
                            height: SizeUtil.height(context) * 0.03,
                          ),
                          CustomInput(
                            hint: 'Cofirm Password',
                            controller: cC,
                            secure: true,
                          ),
                          SizedBox(
                            height: SizeUtil.height(context) * 0.03,
                          ),
                          RoundedButton(
                            child: loading.loading
                                ? const CircularProgressIndicator()
                                : const Text(
                                    "Daftar",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                            press: handleSubmit(context, loading),
                          ),
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
        ),
      ),
    );
  }
}
