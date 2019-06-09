abstract class PlatformBase {
  final bool isLinux;
  final bool isMacOS;
  final bool isWindows;
  final bool isAndroid;
  final bool isIOS;
  final bool isWeb;

  const PlatformBase({
    this.isLinux = false,
    this.isMacOS = false,
    this.isWindows = false,
    this.isAndroid = false,
    this.isIOS = false,
    this.isWeb = false,
  });

  bool get isDesktop => isLinux || isWindows || isMacOS;

  bool get isMobile => isAndroid || isIOS;

  String get platformName {
    if (isLinux) {
      return 'linux';
    } else if (isMacOS) {
      return 'macos';
    } else if (isWindows) {
      return 'windows';
    } else if (isAndroid) {
      return 'android';
    } else if (isIOS) {
      return 'ios';
    } else if (isWeb) {
      return 'web';
    }
    return 'unknown';
  }
}
