import 'package:flutter/material.dart';
import '../module/login/view/login_page.dart';
import '../module/main_menu/view/main_menu_page.dart';
import '../module/restaurant/view/restaurant_page.dart';
import '../module/splash/view/splash_page.dart';

class Routes {
  static const String login = "/login";
  static const String splash = "/splash";
  static const String mainmenu = "/main_menu";
  static const String restaurant = "/restaurant";

  static Map<String, WidgetBuilder> build = {
    login: (context) => const LoginPage(),
    splash: (context) => const SplashPage(),
    mainmenu: (context) => const MainMenuPage(),
    restaurant: (context) => const RestaurantPage(),
  };
}
