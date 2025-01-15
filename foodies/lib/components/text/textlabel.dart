import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Textlabel extends StatelessWidget {
  String? semanticslabel;
  final String text;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  Color? color;
  final TextDecoration? decoration;
  int? maxline;
  double? fontSize;
  TextStyle? textStyle;

  Textlabel.custom({
    this.semanticslabel,
    required this.text,
    this.textAlign = TextAlign.left,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.decoration = TextDecoration.none,
    this.maxline = 1,
    this.fontSize = 15,
    this.textStyle,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: semanticslabel ?? '',
      label: semanticslabel ?? '',
      container: true,
      child: AutoSizeText(
        semanticsLabel: '',
        text,
        maxLines: maxline,
        minFontSize: 10,
        textAlign: textAlign,
        style: textStyle ?? TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color ?? Colors.black, decoration: decoration, fontFamily: "IBMPlexSansThai"),
        overflow: maxline == null ? null : TextOverflow.ellipsis,
        softWrap: maxline == null ? true : false
      ),
    );
  }
}