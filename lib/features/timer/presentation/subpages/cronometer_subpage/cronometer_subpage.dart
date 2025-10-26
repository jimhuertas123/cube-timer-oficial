import 'dart:io';

import 'package:cube_timer_oficial/features/timer/presentation/subpages/cronometer_subpage/platform_subpage/platform_subpage.dart';
import 'package:flutter/cupertino.dart';

class CronometerSubpage extends StatelessWidget {
  const CronometerSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CronometerIosSubpage();
    } else if (Platform.isAndroid) {
      return CronometerAndroidSubpage();
    } else {
      return CronometerDesktopSubpage();
    }
  }
}
