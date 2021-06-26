import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/models/weather_model.dart';
import 'package:flutter_app/screens/weather/components/weather_swiper_pager.dart';

import 'bottom_view.dart';
import 'forecast_view.dart';

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
            ForcastView(weather: weather),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Divider(
                color: Theme.of(context).accentColor.withAlpha(90),
              ),
            ),
            BottomView(weather: weather),
          ],
        ),
      ),
    );
  }
}
