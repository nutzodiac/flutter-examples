
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/theme_app_custom.dart';
import '../text/textlabel.dart';

class ButtonCustom extends StatelessWidget {
  final String semanticslabel;
  final double? setWidth;
  final String? label;
  final TextStyle? textStyle;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final Color? borderColor;
  final double? circular;
  const ButtonCustom({
    super.key,
    required this.semanticslabel,
    this.setWidth,
    required this.label,
    this.textStyle,
    this.foregroundColor,
    this.backgroundColor,
    this.onPressed,
    this.borderColor,
    this.circular
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: setWidth ?? MediaQuery.of(context).size.width,
      child: Semantics(
        identifier: semanticslabel,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: foregroundColor ?? ThemeAppCustom.primaryColor,
            backgroundColor: backgroundColor ?? MyColors.yellowLightBrown,
            disabledForegroundColor: MyColors.grey42,
            disabledBackgroundColor: MyColors.greyBrightDisable,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(circular ?? 10.0),
              side: BorderSide(color: borderColor ?? Colors.transparent, width: 1)
            ),
            shadowColor: const Color.fromRGBO(0, 0, 0, 1),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            minimumSize: const Size(150, 45),
          ),
          child: TextLabel.custom(
            semanticslabel: '${semanticslabel}Text',
            text: label == null ? "" : label.toString(),
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            maxline: 2,
            fontSize: 18,
            textStyle: textStyle,
          )
        ),
      ),
    );
  }
}

class ButtonCustomNoShadow extends StatelessWidget {
  final String semanticslabel;
  final double? setWidth;
  final String label;
  final TextStyle? textStyle;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final Color? borderColor;
  const ButtonCustomNoShadow(
      {super.key,
      required this.semanticslabel,
      this.setWidth,
      required this.label,
      this.textStyle,
      this.foregroundColor,
      this.backgroundColor,
      this.onPressed,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: setWidth ?? MediaQuery.of(context).size.width * 0.4,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor ?? ThemeAppCustom.primaryColor,
          backgroundColor: backgroundColor ?? MyColors.yellowLightBrown,
          disabledForegroundColor: MyColors.grey42,
          disabledBackgroundColor: MyColors.greyBrightDisable,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: borderColor ?? Colors.transparent, width: 1)
          ),
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
          minimumSize: const Size(150, 45),
        ),
        child: TextLabel.custom(
          semanticslabel: semanticslabel,
          text: label,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.bold,
          color: MyColors.brownPullman,
          maxline: 2,
          fontSize: 18,
          textStyle: textStyle,
        ),
      ),
    );
  }
}