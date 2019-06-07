import 'dart:html';
import 'package:stashall/src/platform_specific/load_counter/load_counter_base.dart';

class LoadCounter extends LoadCounterBase {
  LoadCounter(String path) : super(path);

  @override
  Future<int> loadCounter() async {
    print('load counter');
    return int.tryParse(window.localStorage['counter'] ?? '0') ?? 0;
  }
}
