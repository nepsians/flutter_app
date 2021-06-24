import 'package:dio/dio.dart';
import 'package:flutter_app/api/api_keys.dart';
import 'package:flutter_app/models/weather_model.dart';
import 'package:flutter_app/repository/base_api_provider.dart';

class WeatherApiProvider extends BaseApiProvider {
  static const baseUrl = 'http://api.openweathermap.org';

  Future<Weather> getWeather({String cityName = ""}) async {
    final url =
        '$baseUrl/data/2.5/weather?q=$cityName&appid=${ApiKey.weatherKey}';

    try {
      final response = await dio.get(url);

      return Weather.fromJson(response.data);
    } on DioError catch (e) {
      throw e;
    }
  }
}
