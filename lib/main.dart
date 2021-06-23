import 'package:flutter/material.dart';
import 'package:flutter_app/store/app/app_reducer.dart';
import 'package:flutter_app/store/app/app_state.dart';
import 'package:flutter_app/store/weather/weather_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
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
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainApp(),
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
          converter: (store) => WeatherFormViewModal.fromStore(store),
          builder: (context, viewModal) => Center(
            child: Text("Hello world"),
          ),
        ),
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
