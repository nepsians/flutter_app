import 'package:flutter/material.dart';
import 'package:flutter_app/screens/weather/components/main_weather.dart';
import 'package:flutter_app/store/app/app_state.dart';
import 'package:flutter_app/store/weather/weather_actions.dart';
import 'package:flutter_app/store/weather/weather_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) =>
            SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: StoreConnector<AppState, WeatherFormViewModal>(
              onInit: (store) {
                store.dispatch(fetchWeatherAction(context));
              },
              distinct: true,
              converter: (store) => WeatherFormViewModal.fromStore(store),
              builder: (context, viewModal) {
                final WeatherState weatherState = viewModal.weather;

                if (weatherState.isWeatherLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).accentColor.withAlpha(90),
                    ),
                  );
                }

                if (weatherState.weatherError) {
                  return Center(
                    child: Text(weatherState.errorMsg?.toUpperCase() ?? ""),
                  );
                }

                return MainWeatherContainer(weather: weatherState.weather);
              },
            ),
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
