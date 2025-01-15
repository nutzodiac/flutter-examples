import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'theme/color_app.dart';
import 'theme/theme_button_model.dart';
import 'theme/theme_model.dart';
import 'theme/theme_text_model.dart';

class ThemeAppCustom {
  static String nameApp = "Flutter";
  static Color primaryColor = Color.fromRGBO(210, 160, 9, 1);
  static List<Color> backgroundColor = [
    Color.fromRGBO(255, 255, 255, 0.8), 
    Color.fromRGBO(255, 237, 182, 0.8), 
    Color.fromRGBO(254, 195, 15, 1), 
    Color.fromRGBO(255, 197, 24, 1)
  ]; //#BB8D47
  static List<Color> toolbarColor = [
    Color.fromRGBO(210, 160, 9, 1), 
    Color.fromRGBO(253, 202, 45, 1), 
    Color.fromRGBO(255, 232, 159, 1)
  ];

  static ThemeAppModel themeDefault = ThemeAppModel(
    backgroundGradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: backgroundColor),
    toolbarGradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: toolbarColor),
    bgColor: Colors.white,
    toolbarColor: Colors.white,
    shimmerBaseColor: const Color.fromARGB(255, 244, 248, 253),
    shimmerHighlightColor: Colors.white,
    themeButtonModel: ThemeButtonModel(activeColor: ColorApp.orange, inactiveColor: ColorApp.darkGray),
    themeTextModel: ThemeTextModel(
      textSizeSS: 8.sp,
      textSizeS: 11.sp,
      textSizeM: 13.sp,
      textSizeL: 16.sp,
      textSizeXL: 18.sp,
      textSizeXXL: 24.sp,
      textSizeXXXL: 32.sp
    ),
    fontFamily: "IBMPlexSansThai",
    paddingBlockDescription: EdgeInsets.only(top: 15.sp, left: 20.sp, right: 20.sp, bottom: 15.sp),
  );
}
