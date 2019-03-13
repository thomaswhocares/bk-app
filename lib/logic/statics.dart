import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceProvider {
  static final SharedPreferenceProvider _sharedPreferenceProvider =
      new SharedPreferenceProvider._internal();
  SharedPreferences _sharedPreferences;

  SharedPreferenceProvider._internal() {
    init();
  }

  factory SharedPreferenceProvider() {
    return _sharedPreferenceProvider;
  }

  Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  get sharedPreferences {
    if (_sharedPreferences != null) {
      try {
        return _sharedPreferences;
      } catch (e) {
        print(e);
      }
    }
  }
}

class DBProvider {}
