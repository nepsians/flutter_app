import 'package:flutter_app/models/weather_model.dart';
import 'package:meta/meta.dart';

@immutable
class WeatherState {
  final Weather weather;
  final bool isWeatherLoading;
  final bool weatherError;

  WeatherState(
      {required this.weather,
      required this.isWeatherLoading,
      required this.weatherError});

  factory WeatherState.intial() => WeatherState(
        weather: Weather(),
        isWeatherLoading: false,
        weatherError: false,
      );

  WeatherState copyWith(
      {bool isLoading = false,
      Weather weather = const Weather(),
      bool weatherError = false}) {
    return WeatherState(
        weather: this.weather,
        isWeatherLoading: this.isWeatherLoading,
        weatherError: this.weatherError);
  }
}
