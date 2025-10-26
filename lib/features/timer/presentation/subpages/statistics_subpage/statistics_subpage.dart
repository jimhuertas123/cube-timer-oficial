import 'dart:io';


import 'package:cube_timer_oficial/features/timer/presentation/subpages/statistics_subpage/platform_subpages/platform_subpages.dart';
import 'package:flutter/cupertino.dart';

class StatisticsSubpage extends StatelessWidget {
  const StatisticsSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return StatisticsIosSubpage();
    } else if (Platform.isAndroid) {
      return StatisticsAndroidSubpage();
    } else {
      return StatisticsDesktopSubpage();
    }
  }
}