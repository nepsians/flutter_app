import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/models/weather_model.dart';
import 'package:flutter_app/screens/weather/components/tile_value.dart';
import 'package:flutter_app/screens/weather/components/weather_swiper_pager.dart';
import 'package:flutter_app/utils/converters.dart';
import 'package:intl/intl.dart';

class MainWeatherContainer extends StatelessWidget {
  final Weather weather;

  const MainWeatherContainer({Key? key, required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              this.weather.cityName.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Theme.of(context).accentColor,
                letterSpacing: 5,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.weather.description.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 15,
                color: Theme.of(context).accentColor,
                letterSpacing: 5,
              ),
            ),
            WeatherSwiperPager(
              weather: weather,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Divider(
                color: Theme.of(context).accentColor.withAlpha(90),
              ),
            ),
            Container(
              height: 70,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = this.weather.forecast[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Center(
                        child: TileValue(
                      label: DateFormat('E, ha').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              item.time * 1000)),
                      value:
                          '${item.temperature.as(TemperatureUnit.celsius).round()}°',
                      iconData: item.getIconData(),
                    )),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  color: Colors.white,
                  height: 100,
                ),
                itemCount: this.weather.forecast.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Divider(
                color: Theme.of(context).accentColor.withAlpha(90),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              TileValue(
                  label: "wind speed", value: '${this.weather.windSpeed} m/s'),
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
                  label: "sunrise",
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
                  label: "sunset",
                  value: DateFormat('h:mm a').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          this.weather.sunset * 1000))),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Center(
                    child: Container(
                  width: 1,
                  height: 30,
                  color: Theme.of(context).accentColor.withAlpha(50),
                )),
              ),
              TileValue(label: "humidity", value: '${this.weather.humidity}%'),
            ]),
          ],
        ),
      ),
    );
  }
}
