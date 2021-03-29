import 'package:fidisys_game/routes.dart';
import 'package:fidisys_game/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FidisysGameApp());
}

class FidisysGameApp extends StatefulWidget {
  @override
  _FidisysGameAppState createState() => _FidisysGameAppState();
}

class _FidisysGameAppState extends State<FidisysGameApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fidisys Game',
      theme: appTheme(context),
      home: LoginScreen(),
      routes: routes,
    );
  }
}
