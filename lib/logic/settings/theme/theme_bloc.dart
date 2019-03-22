import 'package:bkapp/logic/singleton.dart' as Singletons;
import 'dart:convert';
import 'package:bkapp/logic/settings/theme/theme_change_event.dart';
import 'package:bkapp/logic/settings/theme/theme_state.dart';
import 'package:bloc/bloc.dart';

class ThemeBloc extends Bloc<ChangeThemeEvent, ThemeState> {
  @override
  ThemeState get initialState {
    try {
      return ThemeState.fromJson(json.decode(
          Singletons.SharedPreferenceProvider()
              .sharedPreferences
              .getString('theme')));
    } catch (e) {
      print(e);
      return ThemeState.dark();
    }
  }

  @override
  Stream<ThemeState> mapEventToState(
    ThemeState currentState,
    ChangeThemeEvent event,
  ) async* {
    if (event is ChangeDarkTheme) {
      ThemeState themeState = ThemeState.dark();
      Singletons.SharedPreferenceProvider()
          .sharedPreferences
          .setString('theme', json.encode(ThemeState.darkTheme()));
      yield themeState;
    } else if (event is ChangeLightTheme) {
      ThemeState themeState = ThemeState.light();
      Singletons.SharedPreferenceProvider()
          .sharedPreferences
          .setString('theme', json.encode(ThemeState.lightTheme()));
      yield themeState;
    }
  }
}
