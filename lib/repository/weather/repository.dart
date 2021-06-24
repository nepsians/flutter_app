import 'package:flutter_app/models/weather_model.dart';
import 'package:flutter_app/repository/weather/weather_api_provider.dart';

class WeatherRepository {
  final WeatherApiProvider _apiProvider;

  WeatherRepository(this._apiProvider);

  WeatherApiProvider get apiProvider => _apiProvider;

  Future<Weather> getWeather({required String cityName}) async {
    return await _apiProvider.getWeather(cityName: cityName);
  }
}
