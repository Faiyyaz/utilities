import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtilities {
  Future<void> setValue({@required String key, @required dynamic value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (value is bool) {
      sharedPreferences.setBool(key, value);
    }
    if (value is int) {
      sharedPreferences.setInt(key, value);
    }
    if (value is double) {
      sharedPreferences.setDouble(key, value);
    }
    if (value is List<String>) {
      sharedPreferences.setStringList(key, value);
    }
    sharedPreferences.setString(key, value);
  }

  Future<dynamic> getValue({@required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(key);
  }

  Future<bool> clear() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.clear();
  }
}
