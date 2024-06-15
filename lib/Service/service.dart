import 'package:mc_queen_courier/AtomicWidgets/atomic_service_component.dart';
import 'package:mc_queen_courier/Const/const.dart';
import 'package:mc_queen_courier/Model/address_model.dart';
import 'package:mc_queen_courier/Model/authentication_model.dart';
import 'package:mc_queen_courier/Model/cargo_model.dart';
import 'package:mc_queen_courier/Model/courier_model.dart';
import 'package:mc_queen_courier/Model/create_cargo_model.dart';
import 'package:mc_queen_courier/Model/employee_destination_model.dart';
import 'package:mc_queen_courier/Model/employee_model.dart';
import 'package:mc_queen_courier/Model/response_error_model.dart';

class ApiServices {
  Future<AuthenticationModel> loginAuth() async {
    try {
      var result = await ServiceProcess.postService(
          path: "${Const.baseUrl}/authentication/login",
          data: {"userName": "muratcals", "password": "C5raxmGc1-"});
      return AuthenticationModel.fromJson(result);
    } on ResponseErrorModel catch (err) {
      return Future.error(err.statusMessage ?? "");
    }
  }

  Future<AuthenticationModel> refreshToken(String oldToken) async {
    try {
      var response = await ServiceProcess.postService(
          path: "${Const.baseUrl}/authentication/refresh", data: oldToken);
      return AuthenticationModel.fromJson(response);
    } on ResponseErrorModel catch (err) {
      return Future.error(err.statusMessage ?? "");
    }
  }

  Future<EmployeeModel> getEmployye({required int employeeId}) async {
    try {
      var response = await ServiceProcess.getService(
        path: "${Const.baseUrl}/employee/id",
        queryParameters: {"id": employeeId},
      );
      return EmployeeModel.fromJson(response);
    } on ResponseErrorModel catch (err) {
      return Future.error(err.statusMessage ?? "");
    }
  }

  Future<CallCourierModel> getCallCourier({required int? cargoId}) async {
    try {
      var response = await ServiceProcess.getService(
        path: "${Const.baseUrl}/callcourier/CallCourierId",
        queryParameters: {"callCourierId": cargoId},
      );
      return CallCourierModel.fromJson(response);
    } on ResponseErrorModel catch (err) {
      return Future.error(err.statusMessage ?? "");
    }
  }

  Future<List<CallCourierModel>> getAllCallCourier() async {
    try {
      var response = await ServiceProcess.getService(
          path: "${Const.baseUrl}/employee/EmployeeId",
          queryParameters: {"EmployeeId": Const.employeeId});
      return (response as List)
          .map((e) => CallCourierModel.fromJson(e))
          .toList();
    } on ResponseErrorModel catch (err) {
      return Future.error(err.statusMessage ?? "");
    }
  }

  Future<String> createCargo({required CreateCargoModel model}) async {
    try {
      await ServiceProcess.putService(
        path: "${Const.baseUrl}/callcourier/UpdateCallCourierId",
        data: createCargoModelToJson(model),
      );
      return Future.value("Kargo Başarıyla oluşturulmuştur");
    } on ResponseErrorModel catch (err) {
      return Future.error(err.statusMessage ?? "");
    }
  }

  Future<EmployeeModel> login(
      {required String userName, required String password}) async {
    try {
      var result = await ServiceProcess.postService(
        accessToken: Const.accessToken,
        path: "${Const.baseUrl}/employee/loginEmployee",
        data: {"userName": userName, "password": password},
      );
      return EmployeeModel.fromJson(result);
    } on ResponseErrorModel catch (err) {
      return Future.error(err.statusMessage ?? "");
    }
  }

  Future<List<EmployeeDestinationModel>> getEmployeeDestination() async {
    try {
      var response = await ServiceProcess.getService(
        path: "${Const.baseUrl}/employee/EmployeeId",
        queryParameters: {"EmployeeId": Const.employeeId},
      );
      return (response as List)
          .map((e) => EmployeeDestinationModel.fromJson(e))
          .toList();
    } on ResponseErrorModel catch (err) {
      return Future.error(err.statusMessage ?? "");
    }
  }

  Future<List<CargoInformationModel>> getEmployeeDestinationOk() async {
    try {
      var response = await ServiceProcess.getService(
        path: "${Const.baseUrl}/employee/EmployeeIdOk",
        queryParameters: {"EmployeeIdOk": Const.employeeId},
      );
      return (response as List)
          .map((e) => CargoInformationModel.fromJson(e))
          .toList();
    } on ResponseErrorModel catch (err) {
      return Future.error(err.statusMessage ?? "");
    }
  }

  Future<AddressModel> getCustomerAddress({required int addressId}) async {
    try {
      var response = await ServiceProcess.getService(
        path: "${Const.baseUrl}/addresses/address",
        queryParameters: {"id": addressId},
      );
      return AddressModel.fromJson(response);
    } on ResponseErrorModel catch (err) {
      return Future.error(err.statusMessage ?? "");
    }
  }
}
