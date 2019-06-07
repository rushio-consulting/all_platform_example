import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:stashall/src/platform_specific/save_counter/save_counter_base.dart';
import 'package:stashall/src/stores/counter/counter.dart';

class SaveCounter extends SaveCounterBase {
  File _file;

  SaveCounter(String path, CounterStore counterStore)
      : super(path, counterStore) {
    _file = File(path);
    if (!_file.existsSync()) {
      _file.createSync();
    }
  }

  @override
  Future<void> saveCounter(int counter) async {
    debugPrint('save $counter on disk at $path');
    await _file.writeAsString('$counter', mode: FileMode.writeOnly);
  }
}
