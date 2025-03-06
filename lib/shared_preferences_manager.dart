import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const String isFirstTimeKey = 'isFirstTime';
  static const String authTokenKey = 'authToken';
  static const String expiresOnKey = 'expiresOn';
  static const String emailKey = 'email';
  static const String usernameKey = 'username';

  static Future<void> setFirstTime(bool isFirstTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isFirstTimeKey, isFirstTime);
  }

  static Future<bool> getFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isFirstTimeKey) ?? true;
  }

  static Future<void> setAuthToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(authTokenKey, token);
  }

  static Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(authTokenKey);
  }

  static Future<void> setExpiresOn(String expiresOn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(expiresOnKey, expiresOn);
  }

  static Future<String?> getExpiresOn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(expiresOnKey);
  }

  static Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(authTokenKey);
    await prefs.remove(expiresOnKey);
    await prefs.remove(emailKey);
    await prefs.remove(usernameKey);
  }

  static Future<void> setEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(emailKey, email);
  }

  static Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(emailKey);
  }

  static Future<void> setUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(usernameKey, username);
  }

  static Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(usernameKey);
  }
}
