import 'package:cube_timer_oficial/features/menu_content/menu_content.dart';
import 'package:cube_timer_oficial/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class IosPllAlgorithmsPage extends StatelessWidget {
  const IosPllAlgorithmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Column(
        children: [
          AppBarHome(
            actualPageIndex: 0,
            isTimeRunning: false,
            onConfigTabPressed: () {
              showCupertinoModalBottomSheet(
                context: context,
                builder: (context) =>
                    MenuBottomModal(title: 'Settings', pageContext: context),
              );
            },
          ),
          Text('iOS PLL Algorithm Page Content'),
        ],
      ),
    );
  }
}
