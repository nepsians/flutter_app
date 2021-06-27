import 'package:flutter/material.dart';
import 'package:flutter_app/store/settings/setting_actions.dart';
import 'package:flutter_app/utils/converters.dart';
import 'package:redux/redux.dart';

class UnitOptions extends StatelessWidget {
  final Store store;
  const UnitOptions({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
          child: Text(
            "Unit",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            store.dispatch(ChangeTempUnit(TemperatureUnit.celsius));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                )),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Celsius",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Radio(
                  value: TemperatureUnit.celsius,
                  groupValue: store.state.settingState.tempUnit,
                  onChanged: (value) {
                    store.dispatch(ChangeTempUnit(TemperatureUnit.kelvin));
                  },
                  activeColor: Theme.of(context).accentColor,
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).primaryColor,
          height: 2,
        ),
        GestureDetector(
          onTap: () {
            store.dispatch(ChangeTempUnit(TemperatureUnit.fahrenheit));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor.withOpacity(0.1),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fahrenheit",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Radio(
                  value: TemperatureUnit.fahrenheit,
                  groupValue: store.state.settingState.tempUnit,
                  onChanged: (value) {
                    store.dispatch(ChangeTempUnit(TemperatureUnit.fahrenheit));
                  },
                  activeColor: Theme.of(context).accentColor,
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).primaryColor,
          height: 2,
        ),
        GestureDetector(
          onTap: () {
            store.dispatch(ChangeTempUnit(TemperatureUnit.kelvin));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                )),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Kelvin",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Radio(
                  value: TemperatureUnit.kelvin,
                  groupValue: store.state.settingState.tempUnit,
                  onChanged: (value) {
                    store.dispatch(ChangeTempUnit(TemperatureUnit.kelvin));
                  },
                  activeColor: Theme.of(context).accentColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
