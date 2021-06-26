import 'package:equatable/equatable.dart';
import 'package:flutter_app/store/theme/store.dart';
import 'package:flutter_app/store/weather/weather_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState extends Equatable {
  final WeatherState weatherState;
  final ThemeState themeState;

  AppState({required this.themeState, required this.weatherState});

  factory AppState.initialState() => AppState(
        weatherState: WeatherState.intial(),
        themeState: ThemeState.intial(),
      );

  AppState copyWith({required AppState appState}) => AppState(
        weatherState: appState.weatherState,
        themeState: appState.themeState,
      );

  @override
  List<Object?> get props => [weatherState, themeState];
}
