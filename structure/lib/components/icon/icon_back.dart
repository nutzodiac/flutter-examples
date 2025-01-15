import 'package:flutter/material.dart';

class IconBack extends StatelessWidget {
  final GestureTapCallback? callback;
  const IconBack({super.key, this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
            callback?.call();
          },
          child: Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
            child: Image.asset('assets/icons/angle-left-b.png'),
          ),
        ),
      ),
    );
  }
}