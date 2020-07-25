import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class CustomIconButton extends StatelessWidget {
  final double size;
  final Color color;
  final IconData iconData;
  final Function onPressed;

  CustomIconButton({
    @required this.size,
    @required this.color,
    @required this.iconData,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      color: color,
      icon: Icon(iconData),
      iconSize: size.sp,
    );
  }
}
