import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BottomSheetUtilities {
  void showBottomSheet({
    @required BuildContext context,
    @required Widget widget,
    @required BottomSheetType bottomSheetType,
    bool isExpanded = false,
    bool isDismissible: true,
    bool isNestedNavigation: false,
    Function onClosed,
  }) {
    switch (bottomSheetType) {
      case BottomSheetType.ANDROID:
        showMaterialModalBottomSheet(
          expand: isExpanded,
          isDismissible: isDismissible,
          context: context,
          builder: (context, scrollController) => _getBuilder(
            widget: widget,
            isNestedNavigation: isNestedNavigation,
          ),
        ).whenComplete(() {
          if (onClosed != null) {
            onClosed();
          }
        });
        break;
      case BottomSheetType.IOS:
        showCupertinoModalBottomSheet(
          expand: isExpanded,
          isDismissible: isDismissible,
          context: context,
          builder: (context, scrollController) => _getBuilder(
            widget: widget,
            isNestedNavigation: isNestedNavigation,
          ),
        ).whenComplete(() {
          if (onClosed != null) {
            onClosed();
          }
        });
        break;
      case BottomSheetType.BAR:
        showBarModalBottomSheet(
          expand: isExpanded,
          isDismissible: isDismissible,
          context: context,
          builder: (context, scrollController) => _getBuilder(
            widget: widget,
            isNestedNavigation: isNestedNavigation,
          ),
        ).whenComplete(() {
          if (onClosed != null) {
            onClosed();
          }
        });
        break;
    }
  }

  _getBuilder({@required Widget widget, @required bool isNestedNavigation}) {
    if (isNestedNavigation) {
      return Material(
        child: Navigator(
          onGenerateRoute: (_) => CupertinoPageRoute(
            builder: (context) => Builder(
              builder: (context) => widget,
            ),
          ),
        ),
      );
    } else {
      return widget;
    }
  }
}

enum BottomSheetType { ANDROID, IOS, BAR }
