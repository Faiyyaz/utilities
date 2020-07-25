import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:utilities/components/text/text_view.dart';

class ErrorTextView extends StatelessWidget {
  final String error;
  final String fontFamily;
  final double fontSize;
  final double lineHeight;
  final Color color;

  ErrorTextView({
    @required this.error,
    this.fontFamily,
    this.fontSize = 16.0,
    this.color = Colors.red,
    this.lineHeight = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: error != null,
      child: Padding(
        padding: EdgeInsetsResponsive.symmetric(vertical: 8.0),
        child: TextView(
          text: error,
          fontFamily: fontFamily,
          fontSize: fontSize,
          textColor: color,
          lineHeight: lineHeight,
        ),
      ),
    );
  }
}
