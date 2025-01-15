import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySvgPictureCustom extends StatelessWidget {
  final String assetName;
  final String semanticsLabel;

  const MySvgPictureCustom({
    super.key,
    required this.assetName,
    required this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      semanticsLabel: semanticsLabel
    );
  }
}