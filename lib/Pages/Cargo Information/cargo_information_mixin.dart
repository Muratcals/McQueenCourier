import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mc_queen_courier/Model/create_cargo_model.dart';
import 'package:mc_queen_courier/Service/service.dart';
import 'package:mc_queen_courier/Pages/Cargo%20Information/cargo_information_page.dart';

mixin CargoInformationMixin on State<CargoInformationPage> {
  ApiServices service = ApiServices();
  int cargoId = Get.arguments["cargoId"];
  CreateCargoModel createCargoModel = CreateCargoModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool visibility = false.obs;
}
