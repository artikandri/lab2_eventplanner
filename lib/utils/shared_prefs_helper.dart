import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  getPrefs async(String prefKey) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(prefKey));
  }

  void setPrefs async(String prefKey, var prefValue) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(prefKey, json.encode(prefValue));
  }
}
