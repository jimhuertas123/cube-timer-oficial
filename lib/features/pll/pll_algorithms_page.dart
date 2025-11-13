import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'platform_page/platform_page.dart';

class PllAlgorithmsPage extends ConsumerWidget {
  const PllAlgorithmsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isIOSDevice) {
      return IosPllAlgorithmsPage();
    } else if (isAndroidDevice) {
      return AndroidPllAlgorithmsPage();
    } else {
      return AndroidPllAlgorithmsPage();
    }
  }
}
