import 'package:flutter/material.dart';
import 'package:flutter_app/models/weather_model.dart';
import 'package:flutter_app/screens/weather/components/tile_value.dart';
import 'package:flutter_app/store/app/app_state.dart';
import 'package:flutter_app/store/settings/setting_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';

class ForcastView extends StatelessWidget {
  const ForcastView({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: StoreConnector<AppState, SettingState>(
        converter: (store) => store.state.settingState,
        distinct: true,
        builder: (context, SettingState settingState) => ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = this.weather.forecast[index];
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Center(
                  child: TileValue(
                label: DateFormat('E, ha').format(
                    DateTime.fromMillisecondsSinceEpoch(item.time * 1000)),
                value: '${item.temperature.as(settingState.tempUnit).round()}°',
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
    );
  }
}
