import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPrefsHelper {
  SharedPrefsHelper._privateConstructor();

  static final SharedPrefsHelper instance = SharedPrefsHelper._privateConstructor();

  setListData(String key, List value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, json.encode(value));
  }

  Future<List> getListData(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return json.decode(myPrefs.getString(key));
  }
}
