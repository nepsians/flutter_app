import 'package:flutter_app/store/app/app_state.dart';
import 'package:flutter_app/theme/theme.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class ChangeTheme {
  final themeCode;

  ChangeTheme({this.themeCode});
}

ThunkAction<AppState> changeThemeAction(themeCode) {
  print("Themecode:::: ${themeCode}");
  return (Store<AppState> store) {
    store.dispatch(ChangeTheme(themeCode: Themes.LIGHT_THEME_CODE));
  };
}
