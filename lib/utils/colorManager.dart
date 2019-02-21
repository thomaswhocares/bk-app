import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class ColorManager {
  String _colorProfile;

  Color _textColor, _buttonBackground;
  Color _background, _accent, _highlight;

  ColorManager() {
    this._colorProfile = "dark";
    this._textColor = Color.fromARGB(255, 255, 255, 255);
    this._background = Color.fromARGB(255, 29, 29, 29);
    this._buttonBackground = Color.fromARGB(255, 58, 58, 59);
    this._accent = Color.fromARGB(255, 58, 58, 59);
    this._highlight = Color.fromARGB(255, 226, 0, 122);

    FlutterStatusbarcolor.setStatusBarColor(this._background);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  }

  Color get textColor => _textColor;
  Color get buttonBackground => _buttonBackground;
  Color get background => _background;
  Color get accent => _accent;
  Color get highlight => _highlight;


  setColorProfile(String x) {
    if (x == "dark") {
      _textColor = Colors.white;
      debugPrint("sadasd");
    }
  }

}
