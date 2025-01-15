import 'package:flutter/material.dart';

class ScreenEditItem extends StatefulWidget {
  final String itemText;
  ScreenEditItem({Key key, this.itemText}) : super(key: key);

  @override
  _ScreenEditItemState createState() => _ScreenEditItemState(this.itemText);
}

class _ScreenEditItemState extends State<ScreenEditItem> {
  final String itemText;

  _ScreenEditItemState(this.itemText);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('This is edit item page'),
            Text(itemText),
          ],
        ),
      ),
    );
  }
}