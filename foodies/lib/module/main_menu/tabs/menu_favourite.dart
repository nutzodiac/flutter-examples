import 'package:flutter/material.dart';

import '../../../components/text/textlabel.dart';

class MenuFavourite extends StatefulWidget {
  const MenuFavourite({super.key});

  @override
  State<MenuFavourite> createState() => _MenuFavouriteState();
}

class _MenuFavouriteState extends State<MenuFavourite> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Textlabel.custom(
              text: "Favourite",
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