import 'package:flutter/material.dart';

import '../../../components/text/textlabel.dart';

class RestaurantMap extends StatefulWidget {
  const RestaurantMap({super.key});

  @override
  State<RestaurantMap> createState() => _RestaurantMapState();
}

class _RestaurantMapState extends State<RestaurantMap> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Textlabel.custom(
              text: "Map",
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            )
          ),
        ],
      ),
    );
  }
}