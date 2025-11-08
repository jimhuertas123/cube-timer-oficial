import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'package:cube_timer_oficial/shared/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NavigationAction {
  openImportExportDialog,
  openAppThemeDialog,
  openColorSchemaDialog,
  openDonateDialog,
  openSettingsRoute,
  goToTimerRoute,
  goToOLLAlgorithmsRoute,
  goToOLLTimerRoute,
  goToPLLAlgorithmsRoute,
  goToPLLTimerRoute,
  goToAboutRoute,
}

typedef NavigationHandler =
    void Function(NavigationAction action, BuildContext context);

final navigationHandlerProvider = Provider<NavigationHandler>((ref) {
  return (NavigationAction action, BuildContext context) {
    switch (action) {
      case NavigationAction.openImportExportDialog:
        // TODO: Handle this case.
        throw UnimplementedError();
      case NavigationAction.openAppThemeDialog:
        isAndroidDevice
            ? showDialog(
                context: context,
                builder: (context) => AppThemeDialog(),
              )
            : showCupertinoDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  content: ThemeChange(), // or build your Cupertino dialog here
                ),
              );
      case NavigationAction.openColorSchemaDialog:
        // TODO: Handle this case.
        throw UnimplementedError();
      case NavigationAction.openDonateDialog:
        // TODO: Handle this case.
        throw UnimplementedError();
      case NavigationAction.goToTimerRoute:
        Navigator.of(context).pushReplacementNamed('/timer');
        break;
      case NavigationAction.openSettingsRoute:
        Navigator.of(context).pushNamed('/settings');
        break;
      case NavigationAction.goToOLLAlgorithmsRoute:
        Navigator.of(context).pushReplacementNamed('/oll_algorithms');
        break;
      case NavigationAction.goToOLLTimerRoute:
        Navigator.of(context).pushReplacementNamed('/oll_timer');
        break;
      case NavigationAction.goToPLLAlgorithmsRoute:
        Navigator.of(context).pushReplacementNamed('/pll_algorithms');
        break;
      case NavigationAction.goToPLLTimerRoute:
        Navigator.of(context).pushReplacementNamed('/pll_timer');
        break;
      case NavigationAction.goToAboutRoute:
        Navigator.of(context).pushNamed('/about');
        break;
    }
  };
});
