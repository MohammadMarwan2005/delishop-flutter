import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataRepo {
  final SharedPreferences sharedPrefs;
  final FlutterSecureStorage storage;

  UserDataRepo({required this.sharedPrefs, required this.storage});

  Future<bool> hasToken() async {
    final value = await storage.read(key: DataAccessKeys.tokenKey);
    return value != null;
  }

  setToken(String value) async {
    await storage.write(key: DataAccessKeys.tokenKey, value: value);
  }

  Future<String> getToken() async {
    return await storage.read(key: DataAccessKeys.tokenKey) ?? "";
  }

  deleteToken() async {
    await storage.delete(key: DataAccessKeys.tokenKey);
  }

  setString(String value, String key) async {
    await sharedPrefs.setString(key, value);
  }

  String? getString(String key) {
    return sharedPrefs.getString(key);
  }
}

class DataAccessKeys {
  static String tokenKey = "tokenKey";
  static String firstNameKey = "firstNameKey";
  static String lastNameKey = "lastNameKey";
  static String langCodeKey = "langCodeKey";
}