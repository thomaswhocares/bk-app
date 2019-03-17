//This whole class is compleatly over complicated BUT you could maybe load custom themes in the future.
import 'package:flutter/material.dart';

class ThemeState {
  final ThemeData themeData;

  const ThemeState({this.themeData});

  //Standart Theme
  factory ThemeState.initial() => ThemeState.light();

  factory ThemeState.dark() {
    return ThemeState.fromJson(darkTheme());
  }

  factory ThemeState.light() {
    return ThemeState.fromJson(lightTheme());
  }

  ThemeState.fromJson(Map<String, dynamic> json)
      : themeData = ThemeData(
          brightness: _brightnessFromString(json['themeData']['brightness']),
          backgroundColor: Color(json['themeData']['backgroundColor']),
          primaryColor: Color(json['themeData']['primaryColor']),
          accentColor: Color(json['themeData']['accentColor']),
          buttonTheme: ButtonThemeData(
            splashColor: Color(json['themeData']['buttonTheme']['splashColor']),
            buttonColor: Color(json['themeData']['buttonTheme']['buttonColor']),
            shape: Border.all(
              color: Color(json['themeData']['buttonTheme']['shape']['color']),
              width: json['themeData']['buttonTheme']['shape']['width'],
            ),
          ),
          primaryTextTheme: TextTheme(
            body1: TextStyle(
              fontSize: json['themeData']['primaryTextTheme']['TextTheme']
                  ['body1']['TextStyle']['fontSize'],
              color: Color(json['themeData']['primaryTextTheme']['TextTheme']
                  ['body1']['TextStyle']['color']),
            ),
          ),
          iconTheme: IconThemeData(
            color: Color(json['themeData']['iconTheme']['color']),
          ),
          toggleableActiveColor: Color(json['themeData']['toggleableActiveColor'])
        );

  static Map<String, dynamic> darkTheme() => {
        'themeData': {
          'brightness': "dark",
          'backgroundColor': Color.fromARGB(255, 32, 21, 43).value,
          'primaryColor': Color.fromARGB(255, 226, 0, 122).value,
          'accentColor': Color.fromARGB(255, 58, 58, 59).value,
          'toggleableActiveColor': Color.fromARGB(255, 226, 0, 122).value,
          'buttonTheme': {
            'splashColor': Color.fromARGB(255, 226, 0, 122).value,
            'buttonColor': Color.fromARGB(255, 32, 21, 43).value,
            'shape': {
              'color': Color.fromARGB(255, 226, 0, 122).value,
              'width': 0.6,
            }
          },
          'iconTheme':{
            'color': Color.fromARGB(255, 226, 0, 122).value,
          },
          'primaryTextTheme': {
            'TextTheme': {
              'body1': {
                'TextStyle': {'fontSize': 20.0, 'color': Colors.white.value}
              }
            }
          }
        }
      };
  static Map<String, dynamic> lightTheme() => {
        'themeData': {
          'brightness': "light",
          'backgroundColor': Colors.white.value,
          'primaryColor': Color.fromARGB(255, 226, 0, 122).value,
          'accentColor': Color.fromARGB(255, 58, 58, 59).value,
          'toggleableActiveColor': Color.fromARGB(255, 226, 0, 122).value,
          'buttonTheme': {
            'splashColor': Color.fromARGB(255, 226, 0, 122).value,
            'buttonColor': Colors.white.value,
            'shape': {
              'color': Color.fromARGB(255, 226, 0, 122).value,
              'width': 0.6,
            }
          },
           'iconTheme':{
            'color': Color.fromARGB(255, 226, 0, 122).value,
          },
          'primaryTextTheme': {
            'TextTheme': {
              'body1': {
                'TextStyle': {'fontSize': 20.0, 'color': Colors.black.value}
              }
            }
          }
        }
      };
  static Brightness _brightnessFromString(String s) {
    if (s == "dark") {
      return Brightness.dark;
    } else if (s == "light") {
      return Brightness.light;
    } else {
      debugPrint(
          "Fehler ThemeState._brightnessFromString gespeicherter Wert ist keine brightness");
      return Brightness.dark;
    }
  }
}
