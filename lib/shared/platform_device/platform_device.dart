import 'dart:io';

final isIOSDevice = Platform.isIOS;
// final isIOSDevice = false;
final isAndroidDevice = Platform.isAndroid;
// final isAndroidDevice = Platform.isIOS;
final isDesktopDevice = !isIOSDevice && !isAndroidDevice;
