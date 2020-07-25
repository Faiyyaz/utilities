import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:utilities/components/text/text_view.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final double fontSize;
  final double cornerRadius;
  final String fontFamily;
  final Function onPressed;

  CustomButton({
    @required this.height,
    @required this.width,
    this.backgroundColor = Colors.black,
    @required this.text,
    this.textColor = Colors.white,
    @required this.fontSize,
    this.fontFamily,
    @required this.onPressed,
    this.cornerRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              height: height,
              minWidth: width,
            ),
      ),
      child: RaisedButtonResponsive(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius.h),
        ),
        onPressed: onPressed,
        color: backgroundColor,
        child: TextView(
          text: text,
          textColor: textColor,
          fontSize: fontSize,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
