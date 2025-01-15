import 'package:flutter/material.dart';

import '../../../components/text/textlabel.dart';

class MenuRandom extends StatefulWidget {
  const MenuRandom({super.key});

  @override
  State<MenuRandom> createState() => _MenuRandomState();
}

class _MenuRandomState extends State<MenuRandom> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Textlabel.custom(
              text: "Random",
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