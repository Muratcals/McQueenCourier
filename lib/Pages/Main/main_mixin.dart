import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mc_queen_courier/Service/service.dart';
import 'package:mc_queen_courier/Pages/Main/main_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

mixin MainMixin on State<MainPage> {
  ApiServices services = ApiServices();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  RxInt selectedMenuItem = 0.obs;

  @override
  void initState() {
    super.initState();
    lifeCycleController();
  }

  void onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      Get.back();
      var result = await Get.toNamed("/cargoInformation",
          arguments: {"cargoId": int.parse(scanData.code!)});
      result != null && result ? setState(() {}) : null;
    });
  }

  void lifeCycleController() {
    AppLifecycleListener(
      onShow: () => setState(() {}),
    );
  }
}
