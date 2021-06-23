import 'package:flutter_app/store/weather/weather_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final WeatherState weatherState;

  AppState({required this.weatherState});

  factory AppState.initialState() =>
      AppState(weatherState: WeatherState.intial());

  AppState copyWith({required AppState appState}) =>
      AppState(weatherState: appState.weatherState);
}
