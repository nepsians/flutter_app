import 'package:redux/redux.dart';

import 'package:flutter_app/store/settings/setting_actions.dart';
import 'package:flutter_app/store/settings/setting_state.dart';

Reducer<SettingState> settingStateReducer = combineReducers<SettingState>([
  TypedReducer<SettingState, ChangeTheme>(_changeTheme),
  TypedReducer<SettingState, ChangeTempUnit>(_changeTempUnit),
]);

SettingState _changeTheme(SettingState themeState, ChangeTheme action) {
  return themeState.copyWith(newThemeCode: action.themeCode);
}

SettingState _changeTempUnit(SettingState themeState, ChangeTempUnit action) {
  return themeState.copyWith(newTempUnit: action.tempUnit);
}
