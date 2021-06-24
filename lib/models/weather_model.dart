import 'package:flutter/cupertino.dart';
import 'package:flutter_app/utils/converters.dart';
import 'package:flutter_app/utils/weather_icon_mapper.dart';

class Weather {
  final int id;
  final int time;
  final int sunrise;
  final int sunset;
  final int humidity;

  final String description;
  final String iconCode;
  final String main;
  final String cityName;

  final double windSpeed;

  final Temperature temperature;
  final Temperature maxTemperature;
  final Temperature minTemperature;

  final List<Weather> forecast;

  const Weather({
    this.id = 0,
    this.time = 0,
    this.sunrise = 0,
    this.sunset = 0,
    this.humidity = 0,
    this.description = '',
    this.iconCode = '',
    this.main = '',
    this.cityName = '',
    this.windSpeed = 0,
    this.temperature = const Temperature(0),
    this.maxTemperature = const Temperature(0),
    this.minTemperature = const Temperature(0),
    this.forecast = const [],
  });

  static Weather fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    return Weather(
      id: weather['id'],
      time: json['dt'],
      description: weather['description'],
      iconCode: weather['icon'],
      main: weather['main'],
      cityName: json['name'],
      temperature: Temperature(intToDouble(json['main']['temp'])),
      maxTemperature: Temperature(intToDouble(json['main']['temp_max'])),
      minTemperature: Temperature(intToDouble(json['main']['temp_min'])),
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
      humidity: json['main']['humidity'],
      windSpeed: intToDouble(json['wind']['speed']),
      forecast: [],
    );
  }

  static List<Weather> fromForecastJson(Map<String, dynamic> json) {
    final weathers = <Weather>[];
    for (final item in json['list']) {
      weathers.add(Weather(
          time: item['dt'],
          temperature: Temperature(intToDouble(
            item['main']['temp'],
          )),
          iconCode: item['weather'][0]['icon']));
    }
    return weathers;
  }

  IconData getIconData() {
    switch (this.iconCode) {
      case '01d':
        return WeatherIcons.clear_day;
      case '01n':
        return WeatherIcons.clear_night;
      case '02d':
        return WeatherIcons.few_clouds_day;
      case '02n':
        return WeatherIcons.few_clouds_day;
      case '03d':
      case '04d':
        return WeatherIcons.clouds_day;
      case '03n':
      case '04n':
        return WeatherIcons.clear_night;
      case '09d':
        return WeatherIcons.shower_rain_day;
      case '09n':
        return WeatherIcons.shower_rain_night;
      case '10d':
        return WeatherIcons.rain_day;
      case '10n':
        return WeatherIcons.rain_night;
      case '11d':
        return WeatherIcons.thunder_storm_day;
      case '11n':
        return WeatherIcons.thunder_storm_night;
      case '13d':
        return WeatherIcons.snow_day;
      case '13n':
        return WeatherIcons.snow_night;
      case '50d':
        return WeatherIcons.mist_day;
      case '50n':
        return WeatherIcons.mist_night;
      default:
        return WeatherIcons.clear_day;
    }
  }

  ntToDouble(dynamic val) {
    if (val.runtimeType == double) {
      return val;
    } else if (val.runtimeType == int) {
      return val.toDouble();
    } else {
      throw new Exception("value is not of type 'int' or 'double' got type '" +
          val.runtimeType.toString() +
          "'");
    }
  }
}
