import 'package:flutter/material.dart';
import 'package:bkapp/logic/theme/theme_change_event.dart';
import 'package:bkapp/logic/theme/theme_state.dart';

import 'package:bloc/bloc.dart';

import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class ThemeBloc extends Bloc<ThemeChangeEvent, ThemeState> {
  @override
  ThemeState get initialState {
    ThemeState initial = ThemeState.initial();
    _changeBarColors(initial.themeData);
    return initial;
  }

  @override
  Stream<ThemeState> mapEventToState(
    ThemeState currentState,
    ThemeChangeEvent event,
  ) async* {
    if (event is ChangeDarkTheme) {
      ThemeData themeData = ThemeState.dark().themeData;
      _changeBarColors(themeData);
      yield ThemeState(themeData: themeData);
    } else if (event is ChangeLightTheme) {
      ThemeData themeData = ThemeState.light().themeData;
      _changeBarColors(themeData);
      yield ThemeState(themeData: themeData);
    }
  }

  _changeBarColors(ThemeData themeData) {
    FlutterStatusbarcolor.setStatusBarColor(themeData.backgroundColor);
    FlutterStatusbarcolor.setNavigationBarColor(themeData.backgroundColor);
    if (useWhiteForeground(themeData.backgroundColor)) {
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    } else {
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }
  }
}
