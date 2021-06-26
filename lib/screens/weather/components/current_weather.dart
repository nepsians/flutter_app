import 'package:flutter/material.dart';
import 'package:flutter_app/models/weather_model.dart';
import 'package:flutter_app/screens/weather/components/tile_value.dart';
import 'package:flutter_app/utils/converters.dart';

class CurrentWeather extends StatelessWidget {
  final Weather weather;
  const CurrentWeather({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          weather.getIconData(),
          color: Theme.of(context).accentColor,
          size: 70,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "${this.weather.temperature.as(TemperatureUnit.celsius).round()}°",
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.w100,
            fontSize: 100,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TileValue(
              label: "max",
              value:
                  "${this.weather.maxTemperature.as(TemperatureUnit.celsius).round()}",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Center(
                child: Container(
                    width: 1, height: 30, color: Theme.of(context).accentColor),
              ),
            ),
            TileValue(
              label: "min",
              value:
                  "${this.weather.minTemperature.as(TemperatureUnit.celsius).round()}",
            ),
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
