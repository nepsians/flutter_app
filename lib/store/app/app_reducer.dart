import 'package:flutter_app/store/app/app_state.dart';
import 'package:flutter_app/store/weather/store.dart';

AppState appStateReducer(AppState state, dynamic action) => AppState(
      weatherState: weatherStateReducer(state.weatherState, action),
    );
