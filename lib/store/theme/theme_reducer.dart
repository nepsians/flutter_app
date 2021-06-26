import 'package:flutter_app/store/theme/store.dart';
import 'package:redux/redux.dart';

Reducer<ThemeState> themeStateReducer = combineReducers<ThemeState>([
  TypedReducer<ThemeState, ChangeTheme>(_loading),
]);

ThemeState _loading(ThemeState themeState, ChangeTheme action) {
  return themeState.copyWith(newThemeCode: action.themeCode);
}
