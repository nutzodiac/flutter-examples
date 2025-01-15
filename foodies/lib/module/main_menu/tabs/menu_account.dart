import 'package:flutter/material.dart';

import '../../../components/text/textlabel.dart';

class MenuAccount extends StatefulWidget {
  const MenuAccount({super.key});

  @override
  State<MenuAccount> createState() => _MenuAccountState();
}

class _MenuAccountState extends State<MenuAccount> {
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
              text: "Account",
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