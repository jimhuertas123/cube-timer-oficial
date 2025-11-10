import 'package:cube_timer_oficial/core/constants/constants.dart';
import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'package:cube_timer_oficial/shared/providers/selected_menu_index.provider.dart';
import 'package:cube_timer_oficial/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef NavigationHandler =
    void Function(NavigationAction action, BuildContext context);

final navigationHandlerProvider = Provider<NavigationHandler>((ref) {
  return (NavigationAction action, BuildContext context) {
    switch (action) {
      case NavigationAction.goToTimerRoute:
        ref.read(selectedMenuIndexProvider.notifier).setIndex(0);
        Navigator.of(context).pushReplacementNamed('/');
        break;
      case NavigationAction.goToOLLTimerRoute:
        ref.read(selectedMenuIndexProvider.notifier).setIndex(2);
        Navigator.of(context).pushReplacementNamed('/oll_timer');
        break;
      case NavigationAction.goToPLLTimerRoute:
        ref.read(selectedMenuIndexProvider.notifier).setIndex(3);
        Navigator.of(context).pushReplacementNamed('/pll_timer');
        break;
      case NavigationAction.goToOLLAlgorithmsRoute:
        ref.read(selectedMenuIndexProvider.notifier).setIndex(5);
        Navigator.of(context).pushReplacementNamed('/oll_algorithms');
        break;
      case NavigationAction.goToPLLAlgorithmsRoute:
        ref.read(selectedMenuIndexProvider.notifier).setIndex(6);
        Navigator.of(context).pushReplacementNamed('/pll_algorithms');
        break;
      case NavigationAction.openImportExportDialog:
        isAndroidDevice
            ? showDialog(context: context, builder: (context) => Container())
            : showImportExportCupertinoDialog(context);
        break;
      case NavigationAction.openAppThemeDialog:
        isAndroidDevice
            ? showAppThemeDialog(context)
            : showAppThemeCupertinoDialog(context);
        break;
      case NavigationAction.openColorSchemaDialog:
        isAndroidDevice
            ? showDialog(context: context, builder: (context) => Container())
            : showColorSchemaCupertinoDialog(context);
        break;
      case NavigationAction.openDonateDialog:
        isAndroidDevice
            ? showDialog(context: context, builder: (context) => Container())
            : showDonateCupertinoDialog(context);
        break;
      case NavigationAction.openSettingsRoute:
        Navigator.of(context).pushNamed('/settings');
        break;
      case NavigationAction.goToAboutRoute:
        Navigator.of(context).pushNamed('/about');
        break;
      case NavigationAction.none:
        break;
    }
  };
});
