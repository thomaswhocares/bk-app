import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class SharedPreferenceProvider {
  
  static SharedPreferences _sharedPreferences;

  init() async{
      _sharedPreferences = await SharedPreferences.getInstance();
  }


  get sharedPreferences {
    if ( _sharedPreferences != null) {
      return _sharedPreferences;
    }else{
      print("The Programmer messed up again big time . _sharedPreferences == null");
      //if i fuck up this badly again i should feel it...
      exit(0);
    }
  }
}