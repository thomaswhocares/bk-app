import 'package:flutter/material.dart';

class ThemeState {
  final ThemeData themeData;

  const ThemeState({this.themeData});

  //Standart Theme
  factory ThemeState.initial() => ThemeState.light();

  factory ThemeState.dark() => ThemeState(
      themeData: ThemeData(
          brightness: Brightness.dark,
          backgroundColor: Color.fromARGB(255, 32, 21, 43),
          primaryColor: Color.fromARGB(255, 226, 0, 122),
          accentColor: Color.fromARGB(255, 58, 58, 59),
          primaryTextTheme:
              TextTheme(body1: TextStyle(fontSize: 20, color: Colors.white))));

  factory ThemeState.light() => ThemeState(
      themeData: ThemeData(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          primaryColor: Color.fromARGB(255, 226, 0, 122),
          accentColor: Color.fromARGB(255, 58, 58, 59),
          primaryTextTheme:
              TextTheme(body1: TextStyle(fontSize: 20, color: Colors.black))));

  ThemeState.fromJson(Map<String, dynamic> json)
      : themeData = ThemeData(
          brightness: Brightness.dark,
          backgroundColor: Color(json['themeData']['backgroundColor']),
          primaryColor: Color(json['themeData']['primaryColor']),
          accentColor: Color(json['themeData']['accentColor']),
          primaryTextTheme: TextTheme(
            body1: TextStyle(
              fontSize: json['themeData']['primaryTextTheme']['TextTheme']
                  ['body1']['TextStyle']['fontSize'],
              color: Color(json['themeData']['primaryTextTheme']['TextTheme']
                  ['body1']['TextStyle']['color']),
            ),
          ),
        );

  Map<String, dynamic> toJson() => {
        'themeData': {
          'brightness': themeData.brightness.toString(),
          'backgroundColor': themeData.backgroundColor.value,
          'primaryColor': themeData.primaryColor.value,
          'accentColor': themeData.accentColor.value,
          'primaryTextTheme': {
            'TextTheme': {
              'body1': {
                'TextStyle': {
                  'fontSize':
                      themeData.primaryTextTheme.body1.fontSize.toDouble(),
                  'color': themeData.primaryTextTheme.body1.color.value
                }
              }
            }
          }
        }
      };
}
