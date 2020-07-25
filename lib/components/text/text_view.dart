import 'package:flutter/cupertino.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class TextView extends StatelessWidget {
  final double fontSize;
  final Color textColor;
  final String fontFamily;
  final String text;
  final int maxLines;
  final double lineHeight;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final TextDecoration textDecoration;

  TextView({
    @required this.fontSize,
    @required this.textColor,
    this.fontFamily,
    @required this.text,
    this.maxLines,
    this.lineHeight,
    this.textAlign = TextAlign.left,
    this.textDecoration = TextDecoration.none,
    this.textOverflow = TextOverflow.clip,
  });

  @override
  Widget build(BuildContext context) {
    return TextResponsive(
      text,
      style: _getStyle(),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }

  //TODO: Method or fields starting with an _ means private
  TextStyle _getStyle() {
    TextStyle textStyle = TextStyle(
      color: textColor,
      fontSize: fontSize,
    );

    if (lineHeight != null) {
      textStyle = textStyle.copyWith(
        height: lineHeight,
      );
    }

    if (fontFamily != null) {
      textStyle = textStyle.copyWith(
        fontFamily: fontFamily,
      );
    }

    if (textDecoration != null) {
      textStyle = textStyle.copyWith(
        decoration: textDecoration,
      );
    }

    return textStyle;
  }
}
