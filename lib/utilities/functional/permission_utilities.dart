import 'dart:io' as platform;

import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtilities {
  Future<bool> checkPermissionStatus({
    @required Permission permission,
  }) async {
    //TODO : check status and return
    PermissionStatus permissionStatus = await permission.status;
    return _checkPermissionStatus(permissionStatus: permissionStatus);
  }

  void getPermission({
    @required Function onDecline,
    Function onAccept,
    @required Permission permission,
  }) async {
    bool isPermissionUndetermined = await _isPermissionRequested(
      permission: permission,
    );

    if (isPermissionUndetermined) {
      bool requestStatus = await _requestPermission(
        permission: permission,
      );

      if (!requestStatus) {
        onDecline();
      } else {
        onAccept();
      }
    } else {
      _checkCurrentStatus(
        permission: permission,
        onAccept: onAccept,
        onDecline: onDecline,
      );
    }
  }

  _checkCurrentStatus({
    @required Permission permission,
    Function onAccept,
    @required Function onDecline,
  }) async {
    bool currentStatus = await checkPermissionStatus(
      permission: permission,
    );

    if (!currentStatus) {
      if (platform.Platform.isIOS) {
        _openPermissionSettings();
      } else if (platform.Platform.isAndroid) {
        //TODO : 2nd system will ask for permission and 1st denied -> isDenied will be called and _checkCurrentStatus will be called
        //TODO : 2nd denied -> isPermanentlyDenied will be called and settings will be opened
        //TODO : any n number of request after isPermanentlyDenied will open settings

        PermissionStatus permissionStatus = await permission.status;
        if (permissionStatus.isDenied) {
          //TODO : will ask the permission again here and the status can be changed hence the method _checkCurrentStatus is called again
          await permission.request();
          _checkCurrentStatus(permission: permission, onDecline: onDecline);
        } else if (permissionStatus.isPermanentlyDenied) {
          _openPermissionSettings();
        }
      } else {
        onDecline();
      }
    } else {
      onAccept();
    }
  }

  bool _checkPermissionStatus({
    @required PermissionStatus permissionStatus,
  }) {
    if (permissionStatus.isGranted) {
      return true;
    } else {
      if (platform.Platform.isIOS) {
        return false;
      } else if (platform.Platform.isAndroid) {
        return false;
      } else {
        return false;
      }
    }
  }

  Future<bool> _requestPermission({
    @required Permission permission,
  }) async {
    //TODO : request the permission
    PermissionStatus permissionStatus = await permission.request();
    return _checkPermissionStatus(permissionStatus: permissionStatus);
  }

  void _openPermissionSettings() {
    openAppSettings();
  }

  Future<bool> _isPermissionRequested({
    @required Permission permission,
  }) async {
    //TODO checking if permission is ever asked
    bool isPermissionStatusUndetermined =
        await permission.status.isUndetermined;
    return isPermissionStatusUndetermined;
  }
}
