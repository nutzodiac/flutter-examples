import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'theme_button_model.dart';
import 'theme_text_model.dart';

class ThemeAppModel {
  LinearGradient backgroundGradient;
  LinearGradient toolbarGradient;
  Color bgColor;
  Color toolbarColor;
  Color shimmerBaseColor;
  Color shimmerHighlightColor;
  ThemeTextModel themeTextModel;
  ThemeButtonModel themeButtonModel;
  String fontFamily;
  EdgeInsets paddingBlockDescription;

  ThemeAppModel({
    required this.backgroundGradient,
    required this.toolbarGradient,
    required this.bgColor,
    required this.toolbarColor,
    required this.shimmerBaseColor,
    required this.shimmerHighlightColor,
    required this.themeTextModel,
    required this.themeButtonModel,
    required this.fontFamily,
    required this.paddingBlockDescription
  });
}