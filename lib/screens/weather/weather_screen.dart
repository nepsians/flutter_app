import 'package:flutter/material.dart';
import 'package:flutter_app/store/app/app_state.dart';
import 'package:flutter_app/store/weather/weather_actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';

import 'components/body.dart';

enum OptionsMenu { changeCity, settings }

class WeatherScreen extends StatefulWidget {
  static final routeName = "/weather_screen";

  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String _cityName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarText(context),
        actions: [
          popUpItem(),
        ],
      ),
      body: WeatherBody(),
    );
  }

  StoreConnector<AppState, Store<dynamic>> popUpItem() {
    return StoreConnector<AppState, Store>(
      converter: (store) => store,
      distinct: true,
      builder: (context, store) => PopupMenuButton<OptionsMenu>(
        child: Icon(
          Icons.more_vert,
          color: Theme.of(context).accentColor,
        ),
        onSelected: (item) => this._onMenuItemPressed(item, store),
        itemBuilder: (context) => <PopupMenuEntry<OptionsMenu>>[
          PopupMenuItem<OptionsMenu>(
            value: OptionsMenu.changeCity,
            child: Text("Change city"),
          ),
        ],
      ),
    );
  }

  Text appBarText(BuildContext context) {
    return Text(
      DateFormat('EEEE, d MMMM yyyy').format(
        DateTime.now(),
      ),
      style: TextStyle(
        color: Theme.of(context).accentColor.withAlpha(98),
        fontSize: 14,
      ),
    );
  }

  _onMenuItemPressed(OptionsMenu item, Store store) {
    switch (item) {
      case OptionsMenu.changeCity:
        _showDialog(store: store);

        break;

      default:
    }
  }

  _showDialog({required Store store}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          "Change city",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text(
              'Search',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            style: ElevatedButton.styleFrom(primary: Colors.white),
            onPressed: () {
              store.dispatch(fetchWeatherAction(context, cityName: _cityName));
              Navigator.of(context).pop();
            },
          ),
        ],
        content: TextField(
          autofocus: true,
          onChanged: (text) {
            _cityName = text;
          },
          decoration: InputDecoration(
            hintText: 'Enter city name',
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          style: TextStyle(color: Colors.black),
          cursorColor: Colors.black,
        ),
      ),
    );
  }
}
