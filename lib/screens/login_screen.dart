import 'package:fidisys_game/controller/auth_controller.dart';
import 'package:fidisys_game/models/auth_cred.dart';
import 'package:fidisys_game/util/custom_button.dart';
import 'package:fidisys_game/util/custom_dialog_box.dart';
import 'package:fidisys_game/util/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/login';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _loginformKey = GlobalKey<FormState>();
  final _loginScreenKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      key: _loginScreenKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _loginformKey,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Text(
                    'Fidigames',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.09,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Text(
                    'Log In',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  CustomTextfield(
                    buildContext: context,
                    controller: emailController,
                    hintText: 'Email',
                    width: 0.85,
                    keyboardInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  CustomTextfield(
                    buildContext: context,
                    controller: passwordController,
                    hintText: 'Password',
                    width: 0.85,
                    keyboardInputType: TextInputType.text,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  CustomButton(
                    buildContext: context,
                    label: 'Sign In',
                    onTapFunc: () {
                      if (_loginformKey.currentState.validate()) {
                        customDialogBox(
                            'Logging in...', _loginScreenKey.currentContext);
                        AuthCred loginCred = AuthCred(
                            email: emailController.text.trim(),
                            password: passwordController.text);
                        emailController.clear();
                        passwordController.clear();
                        LoginController.login(
                            loginCred, _loginScreenKey.currentContext);
                      }
                    },
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
