import 'package:flutter_app/models/weather_model.dart';
import 'package:flutter_app/store/weather/weather_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

abstract class WeatherAction {}

class WeatherLoading extends WeatherAction {}

class WeatherSuccess extends WeatherAction {
  final Weather weather;
  final bool isLoading;

  WeatherSuccess(this.weather, this.isLoading);
}

class WeatherError extends WeatherAction {
  final bool isLoading;
  final bool weatherError;

  WeatherError(this.isLoading, this.weatherError);
}

ThunkAction<WeatherState> fetchWeather() {
  return (Store<WeatherState> store) async {
    store.dispatch(WeatherLoading());
  };
}
