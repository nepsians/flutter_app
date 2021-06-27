import 'package:equatable/equatable.dart';
import 'package:flutter_app/store/settings/store.dart';
import 'package:flutter_app/store/weather/weather_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState extends Equatable {
  final WeatherState weatherState;
  final SettingState settingState;

  AppState({required this.settingState, required this.weatherState});

  factory AppState.initialState() => AppState(
        weatherState: WeatherState.intial(),
        settingState: SettingState.intial(),
      );

  AppState copyWith({required AppState appState}) => AppState(
        weatherState: appState.weatherState,
        settingState: appState.settingState,
      );

  @override
  List<Object?> get props => [weatherState, settingState];
}
