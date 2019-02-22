import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

Color _textColor = Color.fromARGB(255, 255, 255, 255);
Color _background = Color.fromARGB(255, 32, 21, 43);
Color _buttonBackground = Color.fromARGB(255, 32, 21, 43);
Color _accent = Color.fromARGB(255, 58, 58, 59);
Color _highlight = Color.fromARGB(255, 226, 0, 122);
String _colorMode = "dark";

Color get textColor => _textColor;
Color get background => _background;
Color get buttonBackground=>_buttonBackground;
Color get accent => _accent;
Color get highlight => _highlight;
String get colorMode => _colorMode;


void updateStatusBar() {
  FlutterStatusbarcolor.setStatusBarColor(background);
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
}

void enableDarkMode(){
  _textColor = Color.fromARGB(255, 255, 255, 255);
  _background = Color.fromARGB(255, 32, 21, 43);
  _buttonBackground = Color.fromARGB(255, 32, 21, 43);
  _accent = Color.fromARGB(255, 58, 58, 59);
  _highlight = Color.fromARGB(255, 226, 0, 122);
  _colorMode = "dark";
  FlutterStatusbarcolor.setStatusBarColor(background);
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
}

