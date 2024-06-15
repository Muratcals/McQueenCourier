import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mc_queen_courier/Const/const.dart';
import 'package:mc_queen_courier/Service/service.dart';
import 'package:mc_queen_courier/Pages/Login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin LoginMixin on State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  ApiServices service = ApiServices();
  String userName = "";
  String password = "";
  RxBool visibilty = false.obs;

  Future<void> buttonProcess() async {
    bool isValidate = formKey.currentState!.validate();
    if (isValidate) {
      formKey.currentState!.save();
      await service.login(userName: userName, password: password).then((value) {
        Const.employeeId = value.id!;
        Const.employeeModel = value;
        saveDatabase(value.id!);
        EasyLoading.showSuccess("Giriş Başarılı");
        Get.offAllNamed("/main");
      }).onError((error, stackTrace) {
        EasyLoading.showError(error.toString());
      });
    }
  }

  Future<void> saveDatabase(int employeeId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("employeeId", employeeId);
  }

  Future<void> deleteDatabase(int employeeId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
