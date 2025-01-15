import 'package:flutter/material.dart';

import '../../../components/text/textlabel.dart';

class MenuPromotion extends StatefulWidget {
  const MenuPromotion({super.key});

  @override
  State<MenuPromotion> createState() => _MenuPromotionState();
}

class _MenuPromotionState extends State<MenuPromotion> {
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
              text: "Promotion",
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