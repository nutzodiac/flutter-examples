import 'package:flutter/material.dart';

import '../modules/login/view/login_screen.dart';

class Routes {
  static const String login = "/login";

  static Map<String, WidgetBuilder> build = {
    login:(context) => const LoginScreen(),
  };
}
