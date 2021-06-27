import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:flutter_app/store/settings/setting_actions.dart';
import 'package:flutter_app/theme/theme.dart';

class ThemeOptions extends StatelessWidget {
  final Store store;

  const ThemeOptions({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12, left: 4),
          child: Text(
            "Theme",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            store.dispatch(ChangeTheme(themeCode: Themes.DARK_THEME_CODE));
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
                  "Dark",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Radio(
                  value: Themes.DARK_THEME_CODE,
                  groupValue: store.state.settingState.themeCode,
                  onChanged: (value) {
                    store.dispatch(ChangeTheme(themeCode: value));
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
            store.dispatch(ChangeTheme(themeCode: Themes.LIGHT_THEME_CODE));
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
                  "Light",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Radio(
                  value: Themes.LIGHT_THEME_CODE,
                  groupValue: store.state.settingState.themeCode,
                  onChanged: (value) {
                    store.dispatch(ChangeTheme(themeCode: value));
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
