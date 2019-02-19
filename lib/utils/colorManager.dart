import 'package:flutter/material.dart';

class ColorManager {
  String _colorProfile;

  Color _textColor, _buttonBackground;
  Color _background, _acent, _highlight;

  ColorManager() {
    this._colorProfile = "white";
    this._textColor = Colors.black;
    this._buttonBackground = Colors.purple;
  }

  Color get textColor => _textColor;

  setColorProfile(String x) {
    if (x == "dark") {
      _textColor = Colors.white;
      debugPrint("sadasd");
    }
  }
}
