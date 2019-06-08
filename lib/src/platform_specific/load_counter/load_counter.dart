import 'package:path_provider/path_provider.dart';
import 'package:stashall/src/platform_specific/load_counter/load_counter_io.dart'
    if (dart.library.js) 'package:stashall/src/platform_specific/load_counter/load_counter_web.dart';
import 'package:stashall/src/platform_specific/platform/platform.dart';

Future<int> loadCounter(Platform platform) async {
  int value = 0;
  if (platform.isDesktop) {
    value = await LoadCounter('test.db').loadCounter();
  } else if (platform.isMobile) {
    final directory = await getApplicationDocumentsDirectory();
    value = await LoadCounter('${directory.path}/test.db').loadCounter();
  } else if (platform.isWeb) {
    await Future.value();
    value = await LoadCounter(null).loadCounter();
  }
  return value;
}
