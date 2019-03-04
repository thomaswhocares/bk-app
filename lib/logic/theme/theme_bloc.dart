import 'package:flutter/material.dart';
import 'package:bkapp/logic/theme/theme_change_event.dart';
import 'package:bkapp/logic/theme/theme_state.dart';

import 'package:bloc/bloc.dart';

class ThemeBloc extends Bloc<ThemeChangeEvent, ThemeState> {
  @override
  ThemeState get initialState {
    ThemeState initial = ThemeState.initial();
    return initial;
  }

  @override
  Stream<ThemeState> mapEventToState(
    ThemeState currentState,
    ThemeChangeEvent event,
  ) async* {
    if (event is ChangeDarkTheme) {
      ThemeData themeData = ThemeState.dark().themeData;
      yield ThemeState(themeData: themeData);
    } else if (event is ChangeLightTheme) {
      ThemeData themeData = ThemeState.light().themeData;
      yield ThemeState(themeData: themeData);
    }
  }
}