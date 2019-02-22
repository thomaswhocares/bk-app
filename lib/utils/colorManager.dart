import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

Color textColor = Color.fromARGB(255, 255, 255, 255);
Color background = Color.fromARGB(255, 32, 21, 43);
Color buttonBackground = Color.fromARGB(255, 32, 21, 43);
Color accent = Color.fromARGB(255, 58, 58, 59);
Color highlight = Color.fromARGB(255, 226, 0, 122);

void updateStatusBar() {
  FlutterStatusbarcolor.setStatusBarColor(background);
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
}
