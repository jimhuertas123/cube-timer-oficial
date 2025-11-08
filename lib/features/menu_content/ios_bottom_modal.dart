import 'package:cube_timer_oficial/core/constants/constants.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuBottomModal extends ConsumerWidget {
  final BuildContext pageContext;
  const MenuBottomModal({super.key, required this.pageContext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handler = ref.read(navigationHandlerProvider);

    return ListView(
      // physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(height: 220, child: headerDrawer),
        Text('Menu Bottom Modal iOS'),
        CupertinoButton(
          child: const Text('Open Theme'),
          onPressed: () {
            Navigator.of(context).pop();
            handler(NavigationAction.openAppThemeDialog, pageContext);
          },
        ),
      ],
    );
  }
}
