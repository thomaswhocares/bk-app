import 'package:bkapp/logic/singleton.dart' as Singletons;
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
          Singletons.SharedPreferenceProvider()
              .sharedPreferences
              .getString('theme')));
    } catch (e) {
      print(e);
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
