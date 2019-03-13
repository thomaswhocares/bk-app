import 'package:bkapp/logic/statics.dart' as Statics;
import 'package:bkapp/logic/theme/theme_change_event.dart';
import 'package:bkapp/logic/theme/theme_state.dart';
import 'package:bloc/bloc.dart';
import 'dart:convert';

class ThemeBloc extends Bloc<ThemeChangeEvent, ThemeState> {
  @override
  ThemeState get initialState {
    ThemeState initial;
    try {
      initial = ThemeState.fromJson(json.decode(
          Statics.SharedPreferenceProvider()
              .sharedPreferences
              .getString('theme')));
    } catch (e) {
      initial = ThemeState.dark();
    }
    return initial;
  }

  @override
  Stream<ThemeState> mapEventToState(
    ThemeState currentState,
    ThemeChangeEvent event,
  ) async* {
    if (event is ChangeDarkTheme) {
      ThemeState themeState = ThemeState.dark();
      Statics.SharedPreferenceProvider()
          .sharedPreferences
          .setString('theme', json.encode(themeState.toJson()));
      yield themeState;
    } else if (event is ChangeLightTheme) {
      ThemeState themeState = ThemeState.light();
      Statics.SharedPreferenceProvider()
          .sharedPreferences
          .setString('theme', json.encode(themeState.toJson()));
      yield themeState;
    }
  }
}
