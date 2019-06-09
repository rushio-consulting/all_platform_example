import 'dart:io' as io show Platform;

import 'package:stashall/src/platform_specific/rc_cross_platform/platform_base.dart';

class Platform extends PlatformBase {
  Platform()
      : super(
          isLinux: io.Platform.isLinux,
          isWindows: io.Platform.isWindows,
          isMacOS: io.Platform.isMacOS,
          isAndroid: io.Platform.isAndroid,
          isIOS: io.Platform.isIOS,
        );
}
