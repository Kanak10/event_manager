import 'dart:async'; //For StreamController/Stream
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:event_manager/utils/services/navigation_service.dart';
import 'package:event_manager/utils/user_permissions.dart';
import 'package:flutter/material.dart'; //InternetAddress utility

class ConnectionStatusSingleton {
  ConnectionStatusSingleton._internal();

  static final ConnectionStatusSingleton _instance =
      ConnectionStatusSingleton._internal();

  static ConnectionStatusSingleton get instance => _instance;
  final userPermissionSingleton = UserPermissionsSingleton.instance;

  bool hasConnection = false;
  bool isInitial = true;

  Connectivity connectivity = Connectivity();

  StreamController controller = StreamController.broadcast();

  Stream get myStream => controller.stream;

  bool isDialogOpen = false;

  void showOfflinePopup() async {
    if (!hasConnection && !isDialogOpen) {
      isDialogOpen = true;
      showDialog(
        context: NavigationService.navigatorKey.currentContext!,
        barrierDismissible: false,
        builder: (context) => WillPopScope(
          onWillPop: () async => false,
          child: ModalRoute.of(NavigationService.navigatorKey.currentContext!)?.settings.name != '/login'
              ? SizedBox()
              : SizedBox()
        ),
      ).then((value) => isDialogOpen = false);
    }
  }

  void initialize() async {
    var result = await connectivity.checkConnectivity();
    _checkStatus(result);
    controller.sink.add(hasConnection);
    connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  Future<bool> getConnectionStatus() async {
    return _checkStatus(await connectivity.checkConnectivity());
  }

  Future<bool> _checkStatus(List<ConnectivityResult> result) async {
    if (result == ConnectivityResult.none) {
      hasConnection = false;
      controller.sink.add(hasConnection);
      showOfflinePopup();
      return hasConnection;
    }

    bool previousConnection = hasConnection;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else
        hasConnection = false;
    } on SocketException catch (_) {
      hasConnection = false;
    }
    if (previousConnection != hasConnection || isInitial) {
      isInitial = false;
      controller.sink.add(hasConnection);
      showOfflinePopup();
    }
    return hasConnection;
  }

}
