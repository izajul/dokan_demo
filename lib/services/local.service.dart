import 'package:dokan/model/login.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _TAG = "S_Preference: ";
const SESSION = "login_session";
const USER_INFO = "logged_in_user_info";
const SESSION_INFO = "logged_session_info";

class LocalService {
  static Future<SharedPreferences> _getPreference() async {
    return await SharedPreferences.getInstance();
  }

  static Future<bool> clearPreference() async =>
      (await _getPreference()).clear();

  static Future<bool> saveString(String key, String value) async {
    final b = (await _getPreference()).setString(key, value);
    debugPrint("$_TAG String Saved = $b");
    return b;
  }

  static Future<bool> saveBoolean(String key, bool status) async {
    final b = (await _getPreference()).setBool(key, status);
    debugPrint("$_TAG Boolean Saved = $b");
    return b;
  }

  static Future<bool> saveDouble(String key, double value) async {
    final b = (await _getPreference()).setDouble(key, value);
    debugPrint("$_TAG Double Saved = $b");
    return b;
  }

  static Future<bool> saveInteger(String key, int value) async {
    final b = (await _getPreference()).setInt(key, value);
    debugPrint("$_TAG Integer Saved = $b");
    return b;
  }

  static Future<bool> hasSession() async {
    var pref = await _getPreference();
    return pref.getBool(SESSION) ?? false;
  }

  static Future<bool> saveSessionInfo(LoginModel? data) async {
    if (data == null) {
      return false;
    }

    /// Saving that user logged in & session has started
    await saveBoolean(SESSION, true);

    final b = (await _getPreference())
        .setString(SESSION_INFO, loginModelToJson(data));
    debugPrint("$_TAG String Saved = $b");
    return b;
  }

  static Future<LoginModel?> getSessionInfo() async {
    final data = (await _getPreference()).getString(SESSION_INFO);
    if (data != null) {
      return loginModelFromJson(data);
    }
    return null;
  }
}
