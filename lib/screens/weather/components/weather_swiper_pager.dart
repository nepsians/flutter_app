import 'package:flutter/material.dart';
import 'package:flutter_app/models/weather_model.dart';
import 'package:flutter_app/screens/weather/components/current_weather.dart';
import 'package:flutter_app/screens/weather/components/temp_chart.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class WeatherSwiperPager extends StatelessWidget {
  final Weather weather;

  const WeatherSwiperPager({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Swiper(
        itemCount: 2,
        index: 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return CurrentWeather(weather: weather);
          } else if (index == 1) {
            return TemperatureChart(
              weathers: this.weather.forecast,
            );
          }
          return SizedBox();
        },
        pagination: SwiperPagination(
          margin: EdgeInsets.all(5.0),
          builder: DotSwiperPaginationBuilder(
              size: 5,
              activeSize: 5,
              color: Theme.of(context).accentColor.withOpacity(0.4),
              activeColor: Theme.of(context).accentColor),
        ),
      ),
    );
  }
}
