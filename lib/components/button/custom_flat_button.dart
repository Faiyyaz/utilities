import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:utilities/components/text/text_view.dart';

class CustomFlatButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Color textColor;
  final double fontSize;
  final String fontFamily;
  final Function onPressed;

  CustomFlatButton({
    @required this.height,
    @required this.width,
    @required this.text,
    this.textColor = Colors.black,
    this.fontFamily,
    @required this.fontSize,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              height: height.h,
              minWidth: width.w,
            ),
      ),
      child: FlatButton(
        onPressed: onPressed,
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
