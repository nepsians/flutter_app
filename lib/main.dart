import 'package:flutter/material.dart';
import 'package:flutter_app/repository/weather/repository.dart';
import 'package:flutter_app/repository/weather/weather_api_provider.dart';
import 'package:flutter_app/store/app/app_reducer.dart';
import 'package:flutter_app/store/app/app_state.dart';
import 'package:flutter_app/store/weather/weather_actions.dart';
import 'package:flutter_app/store/weather/weather_state.dart';
import 'package:flutter_app/utils/http.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  Http()..init();

  final store = Store<AppState>(
    appStateReducer,
    initialState: AppState.initialState(),
    middleware: [thunkMiddleware, LoggingMiddleware.printer()],
  );

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});

  @override
  Widget build(BuildContext context) {
    final weatherRepository = WeatherRepository(WeatherApiProvider());

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
          providers: [
            Provider<WeatherRepository>.value(value: weatherRepository)
          ],
          child: MainApp(),
        ),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StoreConnector<AppState, WeatherFormViewModal>(
            onInit: (store) {
              store.dispatch(fetchWeatherAction(context));
            },
            converter: (store) => WeatherFormViewModal.fromStore(store),
            builder: (context, viewModal) {
              final weather = viewModal.weather;

              if (weather.isWeatherLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (weather.weatherError) {
                return Center(
                  child: Text(weather.errorMsg ?? ""),
                );
              }

              return Center(
                child: Text(
                    "Temperature: ${viewModal.weather.weather.temperature.celsius}"),
              );
            }),
      ),
    );
  }
}

class WeatherFormViewModal {
  final WeatherState weather;

  WeatherFormViewModal({required this.weather});

  static WeatherFormViewModal fromStore(Store<AppState> store) {
    return WeatherFormViewModal(weather: store.state.weatherState);
  }
}
