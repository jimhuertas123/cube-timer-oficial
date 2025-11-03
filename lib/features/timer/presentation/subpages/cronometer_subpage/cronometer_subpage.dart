import 'package:cube_timer_oficial/features/timer/presentation/subpages/cronometer_subpage/platform_subpage/platform_subpage.dart';
import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'package:flutter/cupertino.dart';

class CronometerSubpage extends StatelessWidget {
  const CronometerSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    if (isIOSDevice) {
      return CronometerIosSubpage();
    } else if (isAndroidDevice) {
      return CronometerAndroidSubpage();
    } else {
      return CronometerDesktopSubpage();
    }
  }
}
