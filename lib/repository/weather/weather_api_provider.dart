import 'package:dio/dio.dart';
import 'package:flutter_app/api/api_keys.dart';
import 'package:flutter_app/models/weather_model.dart';
import 'package:flutter_app/repository/base_api_provider.dart';

class WeatherApiProvider extends BaseApiProvider {
  static const baseUrl = 'http://api.openweathermap.org';

  Future<Weather> getWeather({String cityName = ""}) async {
    final url =
        '$baseUrl/data/2.5/weather?q=$cityName&appid=${ApiKey.weatherKey}';
    final foreCastUrl =
        '$baseUrl/data/2.5/forecast?q=$cityName&appid=${ApiKey.weatherKey}';

    try {
      final response = await dio.get(url);
      final foreCastResponse = await dio.get(foreCastUrl);

      final List<Weather> forecasts =
          Weather.fromForecastJson(foreCastResponse.data);

      Weather weather = Weather.fromJson(response.data);

      weather.forecast = forecasts;

      return weather;
    } on DioError catch (e) {
      throw e;
    }
  }
}
