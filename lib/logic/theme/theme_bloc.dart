import 'package:bkapp/logic/theme/theme_change_event.dart';
import 'package:bkapp/logic/theme/theme_state.dart';
import 'package:bloc/bloc.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<ThemeChangeEvent, ThemeState> {
  static SharedPreferences sharedPreferences;

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  ThemeState get initialState {
    ThemeState initial;
    try{
      initial = ThemeState.fromJson(json.decode(sharedPreferences.getString('theme')));
    }catch (e){
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
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('theme', json.encode(themeState.toJson()));
      yield themeState;
    } else if (event is ChangeLightTheme) {
      ThemeState themeState = ThemeState.light();
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('theme', json.encode(themeState.toJson()));
      yield themeState;
    }
  }
}
