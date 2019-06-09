import 'dart:html';
import 'package:stashall/src/platform_specific/rc_cross_preferences/rc_cross_preferences_base.dart';

class RcCrossPreferences extends RcCrossPreferencesBase {
  static RcCrossPreferences _instance;

  RcCrossPreferences._();

  static Future<RcCrossPreferences> getInstance({String path}) async {
    if (_instance == null) {
      _instance = await Future.value(RcCrossPreferences._());
    }
    return _instance;
  }

  @override
  int getInt(String key, {int defaultValue}) {
    if (!window.localStorage.containsKey('counter')) {
      return defaultValue;
    }
    return int.tryParse(window.localStorage['counter']) ?? defaultValue;
  }

  @override
  Future<void> setInt(String key, int value) async {
    window.localStorage[key] = '$value';
  }
}
