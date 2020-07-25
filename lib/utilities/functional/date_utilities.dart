import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DateUtilities {
  String getNowDateString() {
    DateTime dateTime = DateTime.now().toUtc();
    return dateTime.toIso8601String();
  }

  String getRequestSentDateForToast({
    @required String dateString,
  }) {
    DateTime localTime = DateTime.parse(dateString).toLocal();
    DateFormat dateFormat = DateFormat('h:mm aa MMM dd yyyy');
    String formattedDate = dateFormat.format(localTime);
    formattedDate = formattedDate.replaceAll("AM", "a.m");
    formattedDate = formattedDate.replaceAll("PM", "p.m");
    return formattedDate;
  }

  String getFormattedDate({
    @required String dateString,
    String format = 'h:mm aa',
  }) {
    DateTime dateTime = DateTime.parse(dateString).toLocal();
    DateFormat dateFormat = DateFormat(format);
    String formattedDate = dateFormat.format(dateTime);
    return formattedDate;
  }
}
