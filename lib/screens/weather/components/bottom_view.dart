import 'package:flutter/material.dart';
import 'package:flutter_app/models/weather_model.dart';
import 'package:flutter_app/screens/weather/components/tile_value.dart';
import 'package:intl/intl.dart';

class BottomView extends StatelessWidget {
  const BottomView({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      TileValue(label: "Wind speed", value: '${this.weather.windSpeed} m/s'),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Center(
            child: Container(
          width: 1,
          height: 30,
          color: Theme.of(context).accentColor.withAlpha(50),
        )),
      ),
      TileValue(
          label: "Sunrise",
          value: DateFormat('h:mm a').format(
              DateTime.fromMillisecondsSinceEpoch(
                  this.weather.sunrise * 1000))),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Center(
            child: Container(
          width: 1,
          height: 30,
          color: Theme.of(context).accentColor.withAlpha(50),
        )),
      ),
      TileValue(
          label: "Sunset",
          value: DateFormat('h:mm a').format(
              DateTime.fromMillisecondsSinceEpoch(this.weather.sunset * 1000))),
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Center(
            child: Container(
          width: 1,
          height: 30,
          color: Theme.of(context).accentColor.withAlpha(50),
        )),
      ),
      TileValue(label: "Humidity", value: '${this.weather.humidity}%'),
    ]);
  }
}
