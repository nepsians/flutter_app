import 'package:dio/dio.dart';
import 'package:flutter_app/utils/app_errors.dart';
import 'package:flutter_app/utils/http.dart';

class BaseApiProvider {
  final Dio dio = Http().dio;

  AppBaseError errorHandler(DioError error) {
    if (error.response?.statusCode == 403) {
      return AppBaseError(code: 1000, description: '', stack: error.stackTrace);
    }

    return AppBaseError();
  }
}
