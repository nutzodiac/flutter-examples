import 'package:flutter/material.dart';
import 'package:project/utils/colors.dart';

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
        color: MyColors.blueTextDialog,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      tabs: <Widget>[
        TabWidget(
          semanticslabel: 'TabHome',
          icon: Icons.home_filled,
          text: 'Home'
        ),
        TabWidget(
          semanticslabel: 'TabSearch', 
          icon: Icons.search,
          text: 'Search'
        ),
        TabWidget(
          semanticslabel: 'TabPort', 
          icon: Icons.wb_cloudy,
          text: 'Port'
        ),
        TabWidget(
          semanticslabel: 'TabMore', 
          icon: Icons.more_outlined,
          text: 'More'
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
          icon: icon != null ? Icon(icon, color: MyColors.white) 
          : imagePath != null ? Image.asset(
            imagePath!,
            width:  24,
            height: 24,
          ) : null,
          iconMargin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: text != null ? TextLabel.custom(
            semanticslabel: '${semanticslabel}Text',
            text: text ?? "",
            fontWeight: FontWeight.w500,
            color: color ?? MyColors.white,
          ) : SizedBox(),
        ),
      ),
    );
  }
}