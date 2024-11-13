import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSessionManager {
  final SharedPreferences _prefs;

  SharedPreferencesSessionManager(this._prefs);

  Future<void> setSession(String accessToken) async {
    await _prefs.setString('access_token', accessToken);
  }

  String? getSession() {
    return _prefs.getString('access_token');
  }

  Future<void> clearSession() async {
    await _prefs.remove('access_token');
  }

  static Future<void> clear() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("Token");
    //pref.clear();
  }

  static Future<void> setString(
      {required String key, required String data}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, data);
  }

  static Future<String> getString({required String key}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String res = pref.getString(key) ?? '';
    return res;
  }

  static Future<void> setBool({required String key, required bool data}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(key, data);
  }

  static Future<bool> getBool({required String key}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool res = pref.getBool(key) ?? false;
    return res;
  }
}
