import 'package:flutter/cupertino.dart';

class SnackBarView {
  String message;
  String type;
  String actionLabel;
  bool showForceFully;
  Function onClick;

  SnackBarView({
    @required this.message,
    @required this.type,
    this.actionLabel = 'OK',
    this.onClick,
    this.showForceFully = false,
  });
}
