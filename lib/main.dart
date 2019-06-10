import 'package:flutter/foundation.dart'
    show TargetPlatform, debugDefaultTargetPlatformOverride;
import 'package:flutter/widgets.dart';
import 'package:rc_cross_platform/rc_cross_platform.dart';
import 'package:stashall/src/app.dart';

void main() {
  final platform = Platform();
  //  this is needed at least until https://github.com/flutter/flutter/issues/33881 is fixed
  if (platform.isDesktop) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }

  runApp(
    Stashall(
      platform: platform,
    ),
  );
}
