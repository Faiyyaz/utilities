import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

//TODO if you need to access method of some variables then check getOutlineBorderWithCornerRadius else check getOutlineBorder
class ReusableBorder {
  InputBorder getOutlineBorder({
    color: Color,
    width: double,
  }) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }

  InputBorder getOutlineBorderWithCornerRadius({
    color: Color,
    double width,
    double radius,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius.h),
      ),
      borderSide: BorderSide(
        color: color,
        width: width.toDouble(),
      ),
    );
  }

  InputBorder getUnderlineBorder({
    color: Color,
    double width,
  }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: width.toDouble(),
      ),
    );
  }
}
