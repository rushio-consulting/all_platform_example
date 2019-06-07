import 'dart:io';

import 'package:stashall/src/platform_specific/load_counter/load_counter_base.dart';

class LoadCounter extends LoadCounterBase {
  File _f;

  LoadCounter(String path) : super(path) {
    _f = File(path);
    if (!_f.existsSync()) {
      _f.createSync();
    }
  }

  @override
  Future<int> loadCounter() async {
    return int.tryParse(await _f.readAsString()) ?? 0;
  }
}
