import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final double size;
  final Color color;
  final IconData iconData;
  final int icon;

  CustomIcon({
    @required this.size,
    @required this.color,
    @required this.iconData,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size,
      color: color,
    );
  }
}
