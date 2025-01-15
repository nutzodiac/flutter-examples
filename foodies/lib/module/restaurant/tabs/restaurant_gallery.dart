import 'package:flutter/material.dart';

import '../../../components/text/textlabel.dart';

class RestaurantGallery extends StatefulWidget {
  const RestaurantGallery({super.key});

  @override
  State<RestaurantGallery> createState() => _RestaurantGalleryState();
}

class _RestaurantGalleryState extends State<RestaurantGallery> {
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
              text: "Gallery",
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