import 'dart:convert' as convert;
import 'package:flutter/services.dart' as services;
import 'package:flutter/widgets.dart';
import 'package:phone_number/phone_number.dart';

class Validator {
  static Future<bool> isValidMobileNumber({
    @required String mobileNumber,
    @required String countryCode,
  }) async {
    final PhoneNumber phoneNumberValidator = PhoneNumber();
    try {
      Map<String, dynamic> phoneNumberData = await phoneNumberValidator.parse(
        mobileNumber,
        region: countryCode,
      );
      print('phoneNumberData ${convert.jsonEncode(phoneNumberData)}');
      return true;
    } on services.PlatformException {
      return false;
    }
  }

  //TODO : To escape characters use r'YOUR REGEX HERE'
  static bool isValidEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern, caseSensitive: false);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  static bool isValidPassword(String value) {
    String pattern = r'^(?=.{8,})(?=.*[0-9])(?=.*[A-Za-z]).*$';
    RegExp regex = RegExp(pattern, caseSensitive: true);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  static bool isValidUrlRegex(String value) {
    String pattern =
        r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
    RegExp regex = RegExp(pattern, caseSensitive: false);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }
}
