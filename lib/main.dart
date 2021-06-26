// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/app.dart';
import 'package:flutter_app/store/app/app_reducer.dart';
import 'package:flutter_app/store/app/app_state.dart';
import 'package:flutter_app/utils/http.dart';
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
