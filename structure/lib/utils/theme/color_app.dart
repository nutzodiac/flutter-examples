import 'package:flutter/material.dart';

class ColorApp {
  static const orange = Color.fromRGBO(255, 122, 1, 1);
  static const fontGray = Color.fromRGBO(124, 128, 133, 1);
  static const darkGray = Color.fromRGBO(175, 175, 175, 1);
  static const black = Color.fromRGBO(44, 48, 53, 1);
  static const bgColor = Color.fromRGBO(244, 248, 253, 1);
}

extension ColorHelper on Color {
  static Color fromHex(String hexString) {
    try{
      final buffer = StringBuffer();
      if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    }catch (ex){
      return Colors.black;
    }
  }

  String toHex({bool leadingHashSign = true}) =>
      '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}