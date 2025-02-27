import "package:shared_preferences/shared_preferences.dart";

class SharedPreferencesHelper{
  static late SharedPreferences _prefs;

  /// Initialized in the Main function of the app
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  } 

  static SharedPreferences getSharedPreferences() {
    return _prefs;
  }
}