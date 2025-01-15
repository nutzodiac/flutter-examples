import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/theme_app_custom.dart';

class StyledSwitch extends StatefulWidget {
  final void Function(bool isToggled) onToggled;
  bool isToggled;

  StyledSwitch({super.key, required this.onToggled, required this.isToggled});

  @override
  State<StyledSwitch> createState() => _StyledSwitchState();
}

class _StyledSwitchState extends State<StyledSwitch> {
  double size = 30;
  double innerPadding = 0;

  @override
  void initState() {
    innerPadding = size / 10;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => widget.isToggled = !widget.isToggled);
        widget.onToggled(widget.isToggled);
      },
      child: AnimatedContainer(
        height: size,
        width: size * 2,
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: EdgeInsets.all(innerPadding),
        alignment: widget.isToggled ? Alignment.centerLeft : Alignment.centerRight,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: widget.isToggled ? MyColors.greyGrid : ThemeAppCustom.primaryColor,
        ),
        child: Container(
          width: size - innerPadding * 2,
          height: size - innerPadding * 2,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.white),
        ),
      ),
    );
  }
}
