import 'package:flutter/material.dart';
import 'tabbar.dart';

class RestaurantBarWidget extends StatelessWidget {
  final TabController controller; 

  const RestaurantBarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      padding: EdgeInsets.only(top: 10.0),
      dividerColor: Color.fromARGB(255, 255, 228, 131),
      tabs: <Widget>[
        TabWidget(
          semanticslabel: 'Menu',
          text: 'Menu',
        ),
        TabWidget(
          semanticslabel: 'Coupon',
          text: 'Coupon',
        ),
        TabWidget(
          semanticslabel: 'Gallery',
          text: 'Gallery',
        ),
        TabWidget(
          semanticslabel: 'Map',
          text: 'Map',
        ),
      ],
    );
  }
}