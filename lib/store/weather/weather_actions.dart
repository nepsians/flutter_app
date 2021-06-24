import 'package:dio/dio.dart';
import 'package:flutter_app/models/weather_model.dart';
import 'package:flutter_app/repository/weather/repository.dart';
import 'package:flutter_app/store/app/app_state.dart';
import 'package:provider/provider.dart';
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
  final String errorMsg;

  WeatherError({
    required this.isLoading,
    required this.weatherError,
    required this.errorMsg,
  });
}

ThunkAction<AppState> fetchWeatherAction(context) {
  return (Store<AppState> store) async {
    final weatherRepository = Provider.of<WeatherRepository>(context);

    store.dispatch(WeatherLoading());
    try {
      final weatherResponse =
          await weatherRepository.getWeather(cityName: "lalitpur");

      await Future.delayed(const Duration(milliseconds: 3000));

      store.dispatch(WeatherSuccess(weatherResponse, false));
    } on DioError catch (e) {
      if (e.response?.data["message"] != null) {
        store.dispatch(WeatherError(
          isLoading: false,
          errorMsg: e.response?.data["message"],
          weatherError: true,
        ));
        return;
      }

      store.dispatch(WeatherError(
        isLoading: false,
        errorMsg: "Something went wrong.",
        weatherError: true,
      ));
    }
  };
}
