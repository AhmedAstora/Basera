import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();

  static SpHelper spHelper = SpHelper._();

  SharedPreferences? sharedPreferences;

  initSharedPrefrences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  bool getIsLoginFirstTime() {
    bool isFirstTime = sharedPreferences!.getBool('isFirstTime') ?? true;
    return isFirstTime;
  }

  setIsLoginFirstTime(bool value) {
    sharedPreferences!.setBool('isFirstTime', value);
  }


  setOrgId(String id) {
    sharedPreferences!.setString('orgId', id);
  }

  getOrgId() {
    String orgId = sharedPreferences!.getString('orgId') ?? '';
    return orgId;
  }

  setSessionToken(String id) {
    sharedPreferences!.setString('session', id);
  }

  getSessionToken() {
    String orgId = sharedPreferences!.getString('session') ?? '';
    return orgId;
  }
  setSessionId(String id) {
    sharedPreferences!.setString('sessionId', id);
  }

  getSessionId() {
    String orgId = sharedPreferences!.getString('sessionId') ?? '';
    return orgId;
  }


  setOutletId(String id) {
    sharedPreferences!.setString('outletId', id);
  }

  getOutletId() {
    String sessionId = sharedPreferences!.getString('outletId') ?? '';
    return sessionId;
  }


  setUserId(String id) {
    sharedPreferences!.setString('userId', id);
  }

  getUserId() {
    String TokenId = sharedPreferences!.getString('userId') ?? '';
    return TokenId;
  }

  setApiToken(String id) {
    sharedPreferences!.setString('apiToken', id);
  }

  getApiToken() {
    String TokenId = sharedPreferences!.getString('apiToken') ?? '';
    return TokenId;
  }


  getLanguage() {
    String language = sharedPreferences!.getString('language') ?? 'E';

    return language;
  }

  setLanguage(String language) {
    sharedPreferences!.setString('language', language);
  }

  setTheme({bool isDark = false}) {
    sharedPreferences!.setBool('isDark', isDark);
  }

  bool getTheme() {
    if (sharedPreferences == null) {
      return false;
    }
    bool isFirstTime = sharedPreferences!.getBool('isDark') ?? false;
    return isFirstTime;
  }
}
