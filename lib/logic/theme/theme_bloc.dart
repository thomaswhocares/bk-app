import 'package:flutter/material.dart';
import 'package:bkapp/logic/theme/theme_change_event.dart';
import 'package:bkapp/logic/theme/theme_state.dart';

import 'package:bloc/bloc.dart';

import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class ThemeBloc extends Bloc<ThemeChangeEvent, ThemeState> {
  @override
  ThemeState get initialState {
    ThemeState initial = ThemeState.initial();
    _changeBarColors(initial.themeData.backgroundColor);
    return initial;
  }

  @override
  Stream<ThemeState> mapEventToState(
    ThemeState currentState,
    ThemeChangeEvent event,
  ) async* {
    if (event is ChangeDarkTheme) {
      ThemeData themeData = ThemeState.dark().themeData;
      _changeBarColors(themeData.backgroundColor);
      yield ThemeState(themeData: themeData);
    } else if (event is ChangeLightTheme) {
      ThemeData themeData = ThemeState.light().themeData;
      Future.microtask(() => _changeBarColors(themeData.backgroundColor));
      yield ThemeState(themeData: themeData);
    }
  }

  _changeBarColors(Color backgroundColor) async {
    FlutterStatusbarcolor.setStatusBarColor(backgroundColor);
    FlutterStatusbarcolor.setNavigationBarColor(backgroundColor);
    if (useWhiteForeground(backgroundColor)) {
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    } else {
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    }
  }
}
