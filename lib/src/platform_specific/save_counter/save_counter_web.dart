import 'dart:html';
import 'package:stashall/src/platform_specific/save_counter/save_counter_base.dart';
import 'package:stashall/src/stores/counter/counter.dart';

class SaveCounter extends SaveCounterBase {
  SaveCounter(String path, CounterStore counterStore)
      : super(null, counterStore);

  @override
  Future<void> saveCounter(int counter) async {
    print('save $counter to localstorage');
    window.localStorage['counter'] = '$counter';
  }
}
