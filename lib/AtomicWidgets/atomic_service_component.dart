import 'package:dio/dio.dart';
import 'package:mc_queen_courier/Const/const.dart';
import 'package:mc_queen_courier/Model/response_error_model.dart';
import 'package:mc_queen_courier/Service/error_converter.dart';

class ServiceProcess {
  static Dio dio = Dio();

  static Future<dynamic> getService(
      {required String path, Map<String, dynamic>? queryParameters}) async {
    var options = Options(
      headers: {"Authorization": "Bearer ${Const.accessToken}"},
      sendTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    try {
      var response = await dio.get(path,
          queryParameters: queryParameters, options: options);
      if (httpStatusController(response.statusCode!)) {
        return Future.value(response.data);
      } else {
        throw response.data;
      }
    } on DioException catch (err) {
      ResponseErrorModel model = ResponseErrorConverter.convertStatusCode(
          err.response?.statusCode ?? 500);
      throw model;
    }
  }

  static Future<dynamic> postService<T>(
      {required String path,
      required Object? data,
      Map<String, dynamic>? queryParameters,
      String? accessToken}) async {
    try {
      var options = Options(
        headers: {"Authorization": "Bearer $accessToken"},
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      );
      var response = await dio.post(path,
          data: data,
          queryParameters: queryParameters,
          options: accessToken == null ? null : options);
      if (httpStatusController(response.statusCode!)) {
        return Future.value(response.data);
      } else {
        throw response.data;
      }
    } on DioException catch (err) {
      ResponseErrorModel model = ResponseErrorConverter.convertStatusCode(
          err.response?.statusCode ?? 500);
      throw model;
    }
  }

  static Future<dynamic> putService<T>({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var options = Options(
        headers: {"Authorization": "Bearer ${Const.accessToken}"},
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      );
      var response = await dio.put(path,
          data: data, queryParameters: queryParameters, options: options);
      if (httpStatusController(response.statusCode!)) {
        return Future.value(response.data);
      } else {
        throw response.data;
      }
    } on DioException catch (err) {
      ResponseErrorModel model = ResponseErrorConverter.convertStatusCode(
          err.response?.statusCode ?? 500);
      throw model;
    }
  }

  static Future<dynamic> deleteService<T>(
      {required String path,
      Object? data,
      Map<String, dynamic>? queryParameters}) async {
    try {
      var options = Options(
        headers: {"Authorization": "Bearer ${Const.accessToken}"},
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      );
      var response = await dio.delete(path,
          data: data, queryParameters: queryParameters, options: options);
      if (httpStatusController(response.statusCode!)) {
        return Future.value(response.data);
      } else {
        throw response.data;
      }
    } on DioException catch (err) {
      ResponseErrorModel model = ResponseErrorConverter.convertStatusCode(
          err.response?.statusCode ?? 500);
      throw model;
    }
  }
}

bool httpStatusController(int statusCode) {
  if (statusCode >= 200 && statusCode <= 299) {
    return true;
  } else {
    return false;
  }
}
