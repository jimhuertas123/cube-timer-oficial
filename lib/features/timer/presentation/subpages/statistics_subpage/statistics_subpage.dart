import 'package:cube_timer_oficial/features/timer/presentation/subpages/statistics_subpage/platform_subpages/platform_subpages.dart';
import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'package:flutter/cupertino.dart';

class StatisticsSubpage extends StatelessWidget {
  const StatisticsSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    if (isIOSDevice) {
      return StatisticsIosSubpage();
    } else if (isAndroidDevice) {
      return StatisticsAndroidSubpage();
    } else {
      return StatisticsDesktopSubpage();
    }
  }
}
