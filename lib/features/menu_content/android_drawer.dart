import 'package:cube_timer_oficial/core/core.dart';
import 'package:cube_timer_oficial/features/menu_content/widgets/list_tile_content.dart';
import 'package:cube_timer_oficial/features/menu_content/widgets/list_tile_expandable.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerHome extends ConsumerWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedOption = ref.watch(selectedMenuIndexProvider);
    final handlerNavigation = ref.watch(navigationHandlerProvider);

    return SafeArea(
      top: false,
      child: Drawer(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
        ),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            SizedBox(height: 148, child: headerDrawer),
            const SizedBox(height: 5),
            ...appMenuScreensItems.map((menuItem) {
              return (menuItem.children == null)
                  ? ListTileContent(
                      menuItem: menuItem,
                      selected: selectedOption == menuItem.id,
                      selectedOption: selectedOption,
                      parentContext: context,
                      handlerNavigation: handlerNavigation,
                    )
                  : ListTileExpandable(
                      menuItem: menuItem,
                      subMenuItems: menuItem.children!,
                      selectedOption: selectedOption,
                      parentContext: context,
                      handlerNavigation: handlerNavigation,
                    );
            }),
            const Divider(color: Color.fromRGBO(158, 158, 158, 0.4)),
            const Padding(
              padding: EdgeInsets.only(left: 14.0, top: 6.0, bottom: 20.0),
              child: Text(
                'Otros',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            ...appMenuOthers.map(
              (menuItem) => ListTileContent(
                menuItem: menuItem,
                selected: selectedOption == menuItem.id,
                selectedOption: selectedOption,
                parentContext: context,
                handlerNavigation: handlerNavigation,
              ),
            ),
            const Divider(color: Color.fromRGBO(158, 158, 158, 0.4)),
            ...appMenufinalItems.map(
              (menuItem) => ListTileContent(
                menuItem: menuItem,
                selected: selectedOption == menuItem.id,
                selectedOption: selectedOption,
                parentContext: context,
                handlerNavigation: handlerNavigation,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
