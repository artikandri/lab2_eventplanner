import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPrefsHelper {
  setData(String key, var value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, json.encode(value));
  }

  List getListData(String key) async {
    List list = [];
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    if(myPrefs.getString(key) != null) {
      list = json.decode(myPrefs.getString(key)).toList();
    }
    return list;
}
