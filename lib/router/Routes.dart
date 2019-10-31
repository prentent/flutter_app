import 'package:flutter/material.dart';
import 'package:flutter_app/view/MainPage.dart';

import '../view/Login.dart';
import '../view/WelComePage.dart';
import '../view/MainPage.dart';


Map<String, WidgetBuilder> routesMap = {
  "login": (context) => Login(),
  "welcome": (context) => WelComePage(),
  "main": (context) => MainPage(),

};
