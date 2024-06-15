import 'package:mc_queen_courier/Const/const.dart';
import 'package:mc_queen_courier/Model/authentication_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthorizationProcess {
  static Future<void> getEmployeeId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int employeeId = sharedPreferences.getInt("employeeId") ?? 0;
    Const.employeeId = employeeId;
  }

  static Future<void> updateToken({required AuthenticationModel model}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("accessToken", model.accessToken ?? "");
    sharedPreferences.setString("refreshToken", model.refreshToken ?? "");
    Const.accessToken = model.accessToken ?? "";
  }

  static Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String accessToken = sharedPreferences.getString("accessToken") ?? "";
    String refreshToken = sharedPreferences.getString("refreshToken") ?? "";
    Const.accessToken = accessToken;
    return authenticationModelToJson(AuthenticationModel(
        accessToken: accessToken, refreshToken: refreshToken));
  }

  static Future<void> deleteCustomer() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Const.employeeId = 0;
  }
}
