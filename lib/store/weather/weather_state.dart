import 'package:flutter_app/models/weather_model.dart';
import 'package:meta/meta.dart';

@immutable
class WeatherState {
  final Weather weather;
  final bool isWeatherLoading;
  final bool weatherError;
  final String? errorMsg;

  WeatherState({
    this.errorMsg,
    required this.weather,
    required this.isWeatherLoading,
    required this.weatherError,
  });

  factory WeatherState.intial() => WeatherState(
        weather: Weather(),
        isWeatherLoading: false,
        weatherError: false,
      );

  WeatherState copyWith({
    bool? isLoading,
    Weather? weather,
    bool? weatherError,
    String? errorMsg,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      isWeatherLoading: isLoading ?? this.isWeatherLoading,
      weatherError: weatherError ?? this.weatherError,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
