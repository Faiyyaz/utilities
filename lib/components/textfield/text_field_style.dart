import 'package:flutter/cupertino.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class TextFieldStyle {
  static TextStyle getStyle({
    @required String fontFamily,
    @required double fontSize,
    @required Color color,
    double lineHeight,
    TextDecoration textDecoration,
  }) {
    TextStyle textStyle = TextStyle();

    if (color != null) {
      textStyle = textStyle.copyWith(
        color: color,
      );
    }

    //TODO .sp makes the font size responsive using responsive_widgets. FontSize should in scale pixels
    if (fontSize != null) {
      textStyle = textStyle.copyWith(
        fontSize: fontSize.sp,
      );
    }

    if (lineHeight != null) {
      textStyle = textStyle.copyWith(
        height: lineHeight,
      );
    }

    if (textDecoration != null) {
      textStyle = textStyle.copyWith(
        decoration: textDecoration,
      );
    }

    if (fontFamily != null) {
      textStyle = textStyle.copyWith(
        fontFamily: fontFamily,
      );
    }

    return textStyle;
  }
}
