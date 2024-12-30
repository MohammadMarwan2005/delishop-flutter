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
    return await _storage.read(key: DataAccessKeys.tokenKey) ?? "";
  }

  deleteToken() async {
    await _storage.delete(key: DataAccessKeys.tokenKey);
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
}

class DataAccessKeys {
  static String tokenKey = "tokenKey";
  static String phoneNumberKey = "phoneNumberKey";
  static String firstNameKey = "firstNameKey";
  static String lastNameKey = "lastNameKey";
  static String langCodeKey = "langCodeKey";
  static String hasOnboardedKey = "hasOnboardedKey";
}
