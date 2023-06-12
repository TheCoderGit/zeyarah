import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPrefs {
  static SharedPreferences? _sharedPreferences;
  static const _keyFirstRun = "first run";

  static Future init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future setFirstRun(bool firstRun) async =>
      await _sharedPreferences?.setBool(_keyFirstRun, firstRun);

  ///get the data and if it is null return [false]
  static bool getFirstRun() =>
      _sharedPreferences?.getBool(_keyFirstRun) ?? true;
}
