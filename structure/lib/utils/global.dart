class Global {
  static String baseUrl = "";
  static String socketUrl = "";
  static const String subPath = "";

  static const String apiLang = "$subPath/getlabel";
  static const String apiLogin = "$subPath/doLogin";

  static String currentRoute = "";
  static bool isReloadedToken = false;
}