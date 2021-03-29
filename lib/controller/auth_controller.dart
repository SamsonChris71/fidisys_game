import 'package:fidisys_game/models/auth_cred.dart';
import 'package:fidisys_game/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginController {
  static void login(AuthCred loginCred, BuildContext context) async {
    final auth = FirebaseAuth.instance;

    try {
      var loginResponse = await auth.signInWithEmailAndPassword(
          email: loginCred.email, password: loginCred.password);
      if (loginResponse.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'User logged in successfully',
            ),
          ),
        );
        Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(
            context, HomeScreen.routeName, (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Authentication Failed. Try again!',
            ),
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Authentication Failed. Please check your username and password.',
          ),
        ),
      );
      Navigator.pop(context);
    }
  }
}
