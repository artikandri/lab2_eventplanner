import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  void getPrefs async(String prefKey) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(prefKey));
  }

  void _setPrefs async(String prefKey, var prefValue) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(prefKey, json.encode(prefValue));
  }
}
