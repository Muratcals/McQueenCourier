import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mc_queen_courier/Const/Authorization/authorization_process.dart';
import 'package:mc_queen_courier/Const/const.dart';
import 'package:mc_queen_courier/Model/authentication_model.dart';
import 'package:mc_queen_courier/Model/employee_model.dart';
import 'package:mc_queen_courier/Service/service.dart';
import 'package:mc_queen_courier/Pages/Splash/splash_screen_page.dart';

mixin SplashScreenMixin on State<SplashScreen> {
  ApiServices service = ApiServices();

  void getUser() async {
    try {
      AuthenticationModel model = await service.loginAuth();
      AuthorizationProcess.updateToken(model: model);
      loginModelProcess();
    } catch (ex) {
      refreshTokenProcess();
    }
  }

  Future<void> refreshTokenProcess() async {
    String oldToken = await AuthorizationProcess.getToken();
    try {
      AuthenticationModel model = await service.refreshToken(oldToken);
      AuthorizationProcess.updateToken(model: model);
      loginModelProcess();
    } catch (ex) {
      EasyLoading.showToast(ex.toString());
    }
  }

  void loginModelProcess() async {
    await AuthorizationProcess.getEmployeeId();
    int employeeId = Const.employeeId;
    if (employeeId == 0) {
      Const.employeeModel = EmployeeModel();
      Get.offAllNamed("/login");
    } else {
      try {
        EmployeeModel employeeModel =
            await service.getEmployye(employeeId: employeeId);
        Const.employeeModel = employeeModel;
        Get.offAllNamed("/main");
      } catch (ex) {
        if (ex == "Sayfa Bulunamadı") {
          AuthorizationProcess.deleteCustomer();
          Const.employeeModel = EmployeeModel();
          Get.offAllNamed("/login");
        } else {
          refreshTokenProcess();
        }
      }
    }
  }
}
