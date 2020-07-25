import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class StringUtilities {
  static String convertResponseToString({@required dynamic response}) {
    return convert.jsonEncode(response);
  }
}
