import 'dart:io' hide Platform;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stashall/src/platform_specific/rc_cross_platform/platform.dart';
import 'package:stashall/src/platform_specific/rc_cross_preferences/rc_cross_preferences_base.dart';

class RcCrossPreferences extends RcCrossPreferencesBase {
  static RcCrossPreferences _instance;

  final Platform _platform;
  final SharedPreferences _sharedPreferences;
  final _RcCrossPreferencesIO _rcCrossPreferencesIO;

  RcCrossPreferences._(this._platform,
      {SharedPreferences sharedPreferences,
      _RcCrossPreferencesIO rcCrossPreferencesIO})
      : _sharedPreferences = sharedPreferences,
        _rcCrossPreferencesIO = rcCrossPreferencesIO;

  static Future<RcCrossPreferences> getInstance({String path}) async {
    if (_instance == null) {
      final platform = Platform();
      if (platform.isMobile) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        return _instance = RcCrossPreferences._(
          platform,
          sharedPreferences: sharedPreferences,
        );
      } else if (platform.isDesktop) {
        assert(path != null, 'path must be set for desktop');
        final ioPreferences =
            await _RcCrossPreferencesIO.getInstance(path: path);
        return _instance = RcCrossPreferences._(
          platform,
          rcCrossPreferencesIO: ioPreferences,
        );
      }
      throw ArgumentError('Unkown platform ${platform.platformName}');
    }
    return _instance;
  }

  @override
  int getInt(String key, {int defaultValue}) {
    if (_platform.isMobile) {
      return _sharedPreferences.getInt(key) ?? defaultValue;
    } else if (_platform.isDesktop) {
      return _rcCrossPreferencesIO.getInt(key, defaultValue: defaultValue);
    }
    throw ArgumentError('Platform ${_platform.platformName} is not supported');
  }

  @override
  Future<void> setInt(String key, int value) async {
    if (_platform.isMobile) {
      await _sharedPreferences.setInt(key, value);
    } else if (_platform.isDesktop) {
      await _rcCrossPreferencesIO.setInt(key, value);
    } else {
      throw ArgumentError(
          'Platform ${_platform.platformName} is not supported');
    }
  }
}

class _RcCrossPreferencesIO extends RcCrossPreferencesBase {
  static _RcCrossPreferencesIO _instance;
  final Map<String, dynamic> _values;
  final File _file;

  _RcCrossPreferencesIO._(this._values, this._file);

  static Future<_RcCrossPreferencesIO> getInstance({String path}) async {
    if (_instance == null) {
      final _file = File(path);
      Map values;
      if (await _file.exists()) {
        values = Map<String, dynamic>.fromEntries(
            _file.readAsLinesSync().map((line) {
          final parts = line.split('    =    ');
          return MapEntry(parts.first, int.tryParse(parts.last));
        }).toList());
      } else {
        values = <String, dynamic>{};
      }
      _instance = _RcCrossPreferencesIO._(values, _file);
    }

    return _instance;
  }

  @override
  int getInt(String key, {int defaultValue}) {
    return _values[key] ?? defaultValue;
  }

  @override
  Future<void> setInt(String key, int value) async {
    _values[key] = value;
    await _file.writeAsString(_values.entries
        .map((entry) => '${entry.key}    =    ${entry.value}')
        .toList()
        .join('\n'));
  }
}
