import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

///Shared preference helper class
class SharedPreferenceHelper {
  /// Get the key value as a generic type
  static Future<T?> getFromPref<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();
    switch (T) {
      case int:
        return prefs.getInt(key) as T;
      case List:
        return prefs.getStringList(key) as T;
      default:
        return prefs.get(key) as T;
    }
  }

  /// If [value] is null, this is equivalent to calling [remove()] on the [key]
  static Future<bool> saveToPref<T>(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();

    switch (T) {
      case String:
        return prefs.setString(key, value);
      case bool:
        return prefs.setBool(key, value);
      case double:
        return prefs.setDouble(key, value);
      case int:
        return prefs.setInt(key, value);
      case List:
        return prefs.setStringList(key, value);
      case File:
        return prefs.setString(key, value);
      default:
        return prefs.setString(key, value);
    }
  }

  /// Clear all persistent storage values
  static Future<bool> clearPref() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
  static Future<void> clearPreferenceValue(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
