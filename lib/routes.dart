import 'package:fidisys_game/screens/add_game_screen.dart';
import 'package:fidisys_game/screens/home_screen.dart';
import 'package:fidisys_game/screens/login_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  AddGameScreen.routeName: (context) => AddGameScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
