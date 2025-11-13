import 'package:cube_timer_oficial/features/oll/presentation/platform_page/platform_page.dart';
import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OllAlgorithmsPage extends ConsumerWidget {
  const OllAlgorithmsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isIOSDevice) {
      return IosOllAlgorithmsPage();
    } else if (isAndroidDevice) {
      return AndroidOllAlgorithmsPage();
    } else {
      return AndroidOllAlgorithmsPage();
    }
  }
}
