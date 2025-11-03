import 'dart:io';

import 'package:cube_timer_oficial/features/timer/presentation/subpages/times_subpage/platform_subpage/platform_subpage.dart';
import 'package:flutter/cupertino.dart';

class TimesSubpage extends StatelessWidget {
  const TimesSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return TimesIosSubpage();
    } else if (Platform.isAndroid) {
      return TimesAndroidSubpage();
    } else {
      return TimesDesktopSubpage();
    }
  }
}
