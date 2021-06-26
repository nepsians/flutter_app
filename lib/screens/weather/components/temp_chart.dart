import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_app/models/weather_model.dart';
import 'package:flutter_app/utils/converters.dart';

class TemperatureChart extends StatelessWidget {
  final List<Weather> weathers;

  const TemperatureChart({Key? key, required this.weathers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: charts.TimeSeriesChart(
        [
          charts.Series<Weather, DateTime>(
            id: 'Temp',
            data: weathers,
            colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
            domainFn: (Weather weather, _) =>
                DateTime.fromMillisecondsSinceEpoch(weather.time * 1000),
            measureFn: (Weather weather, _) =>
                weather.temperature.as(TemperatureUnit.celsius),
          ),
        ],
        animate: true,
        domainAxis: charts.DateTimeAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            // Tick and Label styling here.
            labelStyle: charts.TextStyleSpec(
                fontSize: 14, // size in Pts.
                color: charts.ColorUtil.fromDartColor(
                    Theme.of(context).accentColor)),

            // Change the line colors to match text color.
            lineStyle: charts.LineStyleSpec(
                color: charts.ColorUtil.fromDartColor(
                    Theme.of(context).accentColor.withAlpha(90))),
          ),
        ),
        primaryMeasureAxis: charts.NumericAxisSpec(
          tickProviderSpec:
              charts.BasicNumericTickProviderSpec(zeroBound: false),
          renderSpec: charts.GridlineRendererSpec(
            // Tick and Label styling here.
            labelStyle: charts.TextStyleSpec(
                fontSize: 12, // size in Pts.
                color: charts.ColorUtil.fromDartColor(
                    Theme.of(context).accentColor)),

            // Change the line colors to match text color.
            lineStyle: charts.LineStyleSpec(
                color: charts.ColorUtil.fromDartColor(
                    Theme.of(context).accentColor.withAlpha(90))),
          ),
        ),
        animationDuration: Duration(milliseconds: 300),
      ),
    );
  }
}
