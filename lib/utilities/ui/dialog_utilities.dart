import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogUtilities {
  Future<T> showDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    int duration = 200,
    DialogAnimationType dialogAnimation = DialogAnimationType.NORMAL,
    WidgetBuilder builder,
  }) {
    assert(builder != null);
    assert(debugCheckHasMaterialLocalizations(context));

    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return Builder(builder: (BuildContext context) {
          return theme != null
              ? Theme(data: theme, child: pageChild)
              : pageChild;
        });
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.7),
      transitionDuration: Duration(milliseconds: duration),
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return _getAnimation(
          dialogAnimation: dialogAnimation,
          context: context,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
    );
  }

  //TODO: for animation we are referring this link https://medium.com/flutter-community/how-to-animate-dialogs-in-flutter-here-is-answer-492ea3a7262f
  _getAnimation({
    @required DialogAnimationType dialogAnimation,
    @required BuildContext context,
    @required Animation<double> animation,
    @required Animation<double> secondaryAnimation,
    @required Widget child,
  }) {
    switch (dialogAnimation) {
      case DialogAnimationType.NORMAL:
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: child,
        );
        break;
      case DialogAnimationType.SCALE:
        return Transform.scale(
          scale: animation.value,
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
        break;
      case DialogAnimationType.SLIDE_FROM_BOTTOM:
        final curvedValue =
            Curves.easeInOutBack.transform(animation.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, -(curvedValue * 200), 0.0),
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
        break;
      case DialogAnimationType.SLIDE_FROM_TOP_NO_BOUNCE:
        final curvedValue = Curves.easeInOut.transform(animation.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 1000, 0.0),
          child: child,
        );
        break;
      case DialogAnimationType.SLIDE_FROM_TOP:
        final curvedValue =
            Curves.easeInOutBack.transform(animation.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
        break;
    }
  }
}

enum DialogAnimationType {
  NORMAL,
  SCALE,
  SLIDE_FROM_BOTTOM,
  SLIDE_FROM_TOP,
  SLIDE_FROM_TOP_NO_BOUNCE
}
