import 'package:path_provider/path_provider.dart';
import 'package:stashall/src/platform_specific/save_counter/save_counter_io.dart'
    if (dart.library.js) 'package:stashall/src/platform_specific/save_counter/save_counter_web.dart';

import 'package:stashall/src/platform_specific/platform/platform.dart';
import 'package:stashall/src/stores/counter/counter.dart';

Future<SaveCounter> initSaveCounterReaction(
    Platform platform, CounterStore counterStore) async {
  String path;
  if (platform.isDesktop) {
    await Future.value();
    path = 'test.db';
  } else if (platform.isMobile) {
    final directory = await getApplicationDocumentsDirectory();
    path = '${directory.path}/test.db';
  } else if (platform.isWeb) {
    await Future.value();
  }
  return SaveCounter(path, counterStore);
}
