import 'dart:async';

import 'package:mc_queen_courier/main.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';

mixin MainAppMixin on State<MainApp> {
  RxBool visibility = false.obs;

  @override
  void initState() {
    super.initState();
    networkController();
    connectionStream();
    cycleListener();
  }

  void networkController() async {
    var connectivity = await Connectivity().checkConnectivity();
    connectivity == ConnectivityResult.none
        ? visibility.value = false
        : visibility.value = true;
  }

  void connectionStream() {
    Connectivity().onConnectivityChanged.listen(
      (event) {
        event == ConnectivityResult.none
            ? visibility.value = false
            : visibility.value = true;
      },
    );
  }

  void cycleListener() {
    bool isRefresh = false;
    late Timer timer;
    AppLifecycleListener(onHide: () {
      timer = Timer(const Duration(hours: 1), () async {
        isRefresh = true;
      });
    }, onShow: () async {
      timer.cancel();
      if (isRefresh) {
        Restart.restartApp();
        isRefresh = false;
      }
    });
  }
}
