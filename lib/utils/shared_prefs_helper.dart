import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPrefsHelperModel {
  void setData(String key, var value) {}
  getData(String key) {}
}

class SharedPrefsHelper extends SharedPrefsHelperModel {
  @override
  setData(String key, var value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, json.encode(value));
  }

  @override
  getData(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return json.decode(myPrefs.getString(key));
  }
}
