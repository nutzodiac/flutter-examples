import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../text/textlabel.dart';

class TabBarWidget extends StatelessWidget {
  final TabController controller; 

  const TabBarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      padding: EdgeInsets.only(top: 10.0),
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(
        color: const Color.fromARGB(255, 255, 228, 131),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      tabs: <Widget>[
        TabWidget(
          semanticslabel: 'Random',
          imagePath: 'assets/icons/dice.svg',
        ),
        TabWidget(
          semanticslabel: 'Promotion',
          imagePath: 'assets/icons/saleanddiscount.svg',
        ),
        TabWidget(
          semanticslabel: 'Location',
          imagePath: 'assets/icons/location.svg',
        ),
        TabWidget(
          semanticslabel: 'Favourite',
          imagePath: 'assets/icons/heart.svg',
        ),
        TabWidget(
          semanticslabel: 'Account',
          imagePath: 'assets/icons/account.svg',
        ),
      ],
    );
  }
}

class TabWidget extends StatelessWidget {
  final String semanticslabel;
  final String? text;
  final IconData? icon;
  final String? imagePath;
  final Color? color;

  const TabWidget({
    super.key,
    required this.semanticslabel,
    this.text,
    this.icon,
    this.imagePath,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: semanticslabel,
      child: MergeSemantics(
        child: Tab(
          icon: icon != null ? Icon(icon, color: Colors.black) 
          : imagePath != null ? SvgPicture.asset(
            imagePath!,
            width:  40,
            height: 40,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ) : null,
          child: text != null ? Textlabel.custom(
            text: text ?? "",
            fontWeight: FontWeight.w500,
            color: color ?? Colors.black,
          ) : SizedBox(),
        ),
      ),
    );
  }
}