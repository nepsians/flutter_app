import 'package:flutter_app/store/weather/weather_actions.dart';
import 'package:flutter_app/store/weather/weather_state.dart';
import 'package:redux/redux.dart';

Reducer<WeatherState> weatherStateReducer = combineReducers<WeatherState>([
  TypedReducer<WeatherState, WeatherLoading>(_loading),
  TypedReducer<WeatherState, WeatherSuccess>(_success),
  TypedReducer<WeatherState, WeatherError>(_error),
]);

WeatherState _loading(WeatherState weatherState, WeatherLoading action) {
  return weatherState.copyWith(isLoading: true, weatherError: false);
}

WeatherState _success(WeatherState weatherState, WeatherSuccess action) {
  return weatherState.copyWith(
      isLoading: false, weatherError: false, weather: action.weather);
}

WeatherState _error(WeatherState weatherState, WeatherError action) {
  return weatherState.copyWith(isLoading: false, weatherError: true);
}
