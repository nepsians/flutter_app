import 'package:flutter/material.dart';
import 'package:flutter_app/store/app/app_state.dart';
import 'package:flutter_app/store/theme/store.dart';
import 'package:flutter_app/theme/theme.dart';
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
          PopupMenuItem<OptionsMenu>(
            value: OptionsMenu.settings,
            child: Text("Settings"),
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
        print("Change city clicked");
        store.dispatch(ChangeTheme(themeCode: Themes.LIGHT_THEME_CODE));

        break;

      case OptionsMenu.settings:
        print("Settings pressed");
        store.dispatch(ChangeTheme(themeCode: Themes.DARK_THEME_CODE));

        break;
      default:
    }
  }
}
