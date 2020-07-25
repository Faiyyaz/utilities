//TODO: This class contains routing logic
import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushReplacement({
    @required Widget widget,
    bool isFullScreenDialog = false,
  }) {
    return navigatorKey.currentState.pushReplacement(
      MaterialPageRoute(
        builder: (_) => widget,
        fullscreenDialog: isFullScreenDialog,
      ),
    );
  }

  Future<dynamic> push({
    @required Widget widget,
    bool isFullScreenDialog = false,
  }) {
    return navigatorKey.currentState.push(
      MaterialPageRoute(
        builder: (_) => widget,
        fullscreenDialog: isFullScreenDialog,
      ),
    );
  }

  Future<dynamic> pushAndClearStack({
    @required Widget widget,
  }) {
    return navigatorKey.currentState.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (ctx) => widget,
      ),
      (Route<dynamic> route) => false,
    );
  }

  Future<dynamic> pushNamed({
    @required String routeName,
    dynamic arguments,
  }) {
    return navigatorKey.currentState.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushReplacementNamed({
    @required String routeName,
    dynamic arguments,
  }) {
    return navigatorKey.currentState.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> pushNamedAndClearStack({
    @required String routeName,
  }) {
    return navigatorKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
    );
  }

  bool canGoBack() {
    return navigatorKey.currentState.canPop();
  }

  void goBack() {
    if (navigatorKey.currentState.canPop()) {
      navigatorKey.currentState.pop();
    }
  }

  void goBackWithData({
    @required Map<String, dynamic> data,
  }) {
    if (navigatorKey.currentState.canPop()) {
      navigatorKey.currentState.pop(data);
    }
  }
}
