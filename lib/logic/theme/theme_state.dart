
import 'package:flutter/material.dart';

class ThemeState {
  final ThemeData themeData;

  const ThemeState({this.themeData});

  //Standart Theme
  factory ThemeState.initial() => ThemeState(themeData: ThemeData(
      brightness: Brightness.dark,
      backgroundColor: Color.fromARGB(255, 32, 21, 43),
      primaryColor: Color.fromARGB(255, 226, 0, 122),
      accentColor: Color.fromARGB(255, 58, 58, 59),
      primaryTextTheme:
          TextTheme(body1: TextStyle(fontSize: 20, color: Colors.white))
    ));

    factory ThemeState.dark() => ThemeState(themeData: ThemeData(
      brightness: Brightness.dark,
      backgroundColor: Color.fromARGB(255, 32, 21, 43),
      primaryColor: Color.fromARGB(255, 226, 0, 122),
      accentColor: Color.fromARGB(255, 58, 58, 59),
      primaryTextTheme:
          TextTheme(body1: TextStyle(fontSize: 20, color: Colors.white))
    ));

    factory ThemeState.light() => ThemeState(themeData: ThemeData(
      brightness: Brightness.light,
      backgroundColor: Color.fromARGB(255, 32, 21, 43),
      primaryColor: Color.fromARGB(255, 226, 0, 122),
      accentColor: Color.fromARGB(255, 58, 58, 59),
      primaryTextTheme:
          TextTheme(body1: TextStyle(fontSize: 20, color: Colors.white))
    ));
}
