import 'package:flutter/material.dart';
import 'package:flutter_app/store/app/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'components/theme_options.dart';
import 'components/unit_options.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Settings"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Theme.of(context).primaryColor,
        child: StoreConnector<AppState, Store<AppState>>(
          converter: (store) => store,
          builder: (context, store) => ListView(
            children: [
              ThemeOptions(store: store),
              SizedBox(height: 20),
              UnitOptions(store: store),
            ],
          ),
        ),
      ),
    );
  }
}
