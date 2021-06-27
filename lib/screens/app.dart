import 'package:flutter/material.dart';
import 'package:flutter_app/repository/weather/repository.dart';
import 'package:flutter_app/repository/weather/weather_api_provider.dart';
import 'package:flutter_app/route/route_generator.dart';
import 'package:flutter_app/screens/home/Home.dart';
import 'package:flutter_app/store/app/app_state.dart';
import 'package:flutter_app/store/theme/store.dart';
import 'package:flutter_app/theme/theme.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});

  @override
  Widget build(BuildContext context) {
    final weatherRepository = WeatherRepository(WeatherApiProvider());

    return StoreProvider<AppState>(
      store: store,
      child: MultiProvider(
          providers: [
            Provider<WeatherRepository>.value(value: weatherRepository)
          ],
          child: StoreConnector<AppState, ThemeState>(
            converter: (store) => store.state.themeState,
            distinct: true,
            builder: (context, state) => MaterialApp(
              theme: Themes.getTheme(state.themeCode),
              routes: routes,
              initialRoute: HomeScreen.routeName,
            ),
          )),
    );
  }
}
