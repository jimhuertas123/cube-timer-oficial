import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/platform_page/platform_page.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isIOSDevice) {
      return IosAboutPage();
    } else if (isAndroidDevice) {
      return AndroidAboutPage();
    } else {
      return AndroidAboutPage();
    }
  }
}
