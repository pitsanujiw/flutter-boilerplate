import 'package:shared_preferences/shared_preferences.dart';

const String keyId = '8conlay_';
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

Preferences preferences = Preferences();

class Preferences {
  // ------------------ SINGLETON -----------------------
  static final Preferences _preferences = Preferences._internal();
  factory Preferences() => _preferences;
  Preferences._internal();

  /// ----------------------------------------------------------
  /// Generic routine to fetch a preference
  /// ----------------------------------------------------------
  Future<String> getString(String key) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(keyId + key) ?? '';
  }

  /// ----------------------------------------------------------
  /// Generic routine to saves String  a preference
  /// ----------------------------------------------------------
  Future<bool> setString(String name, String value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString(keyId + name, value);
  }

  /// ----------------------------------------------------------
  /// Generic routine to fetch Boolean by Key a preference
  /// ----------------------------------------------------------
  Future<bool> getBool(String name) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getBool(keyId + name) ?? false;
  }

  /// ----------------------------------------------------------
  /// Generic routine to saves Boolean a preference
  /// ----------------------------------------------------------
  Future<bool> setBool(String name, bool value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setBool(keyId + name, value);
  }

  /// ----------------------------------------------------------
  /// Generic routine to fetch Int a preference
  /// ----------------------------------------------------------
  Future<int> getInt(String key) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getInt(keyId + key) ?? 0;
  }

  /// ----------------------------------------------------------
  /// Generic routine to saves Int a preference
  /// ----------------------------------------------------------
  Future<bool> setInt(String name, int value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setInt(keyId + name, value);
  }

  /// ----------------------------------------------------------
  /// Generic routine to get Double a preference
  /// ----------------------------------------------------------
  Future<double> getDouble(String name) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getDouble(keyId + name) ?? 0.0;
  }

  /// ----------------------------------------------------------
  /// Generic routine to set Double a preference
  /// ----------------------------------------------------------
  Future<bool> setDouble(String name, double value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setDouble(keyId + name, value);
  }

  /// ----------------------------------------------------------
  /// Generic routine to remove by keyId a preference
  /// ----------------------------------------------------------
  Future<bool> removeByKey(String name) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.remove(keyId + name);
  }

  /// ----------------------------------------------------------
  /// Generic routine to clear a preference
  /// ----------------------------------------------------------
  Future<bool> clear() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.clear();
  }
}
