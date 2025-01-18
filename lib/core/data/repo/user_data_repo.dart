import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataRepo {
  final SharedPreferences _sharedPrefs;
  final FlutterSecureStorage _storage;

  UserDataRepo(
      {required SharedPreferences sharedPrefs,
      required FlutterSecureStorage storage})
      : _storage = storage,
        _sharedPrefs = sharedPrefs;

  Future<bool> hasToken() async {
    final value = await _storage.read(key: DataAccessKeys.tokenKey);
    return value != null;
  }

  setToken(String value) async {
    await _storage.write(key: DataAccessKeys.tokenKey, value: value);
  }

  Future<String> getToken() async {
    final token = await _storage.read(key: DataAccessKeys.tokenKey) ?? "";
    print('🟢 Debug: READ TOKEN:' + token);
    return token;
  }

  deleteToken() async {
    await _storage.delete(key: DataAccessKeys.tokenKey);
  }

  setInt(int value, String key) async {
    await _sharedPrefs.setInt(key, value);
  }

  int? getInt(String key) {
    return _sharedPrefs.getInt(key);
  }

  setString(String value, String key) async {
    await _sharedPrefs.setString(key, value);
  }

  String? getString(String key) {
    return _sharedPrefs.getString(key);
  }

  setOnboarded() async {
    await _sharedPrefs.setBool(DataAccessKeys.hasOnboardedKey, true);
  }

  bool hasOnboarded() {
    return _sharedPrefs.getBool(DataAccessKeys.hasOnboardedKey) ?? false;
  }

  Future<void> clearAllData() async {
    await _sharedPrefs.clear();
  }
}

class DataAccessKeys {
  static String tokenKey = "tokenKey";
  static String phoneNumberKey = "phoneNumberKey";
  static String firstNameKey = "firstNameKey";
  static String lastNameKey = "lastNameKey";
  static String roleIdKey = "roleKey";
  static String langCodeKey = "langCodeKey";
  static String hasOnboardedKey = "hasOnboardedKey";
}
