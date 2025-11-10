import 'package:cube_timer_oficial/core/constants/constants.dart';
import 'package:cube_timer_oficial/features/menu_content/widgets/cupertino_expandable_list_tile.dart';
import 'package:cube_timer_oficial/features/menu_content/widgets/cupertino_list_tile.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Probably this will be used with this package: https://pub.dev/packages/cupertino_sidemenu

class MenuBottomModal extends ConsumerWidget {
  final BuildContext pageContext;
  final String title;

  const MenuBottomModal({
    super.key,
    required this.pageContext,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final handlerNavigation = ref.watch(navigationHandlerProvider);
    final int selectedOption = ref.watch(selectedMenuIndexProvider);

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemBackground,
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(onPressed: () {}, child: const Text('')),
        middle: Text(title, style: TextStyle(fontSize: 20)),
      ),
      child: ListView(
        // adjust for nav bar height
        children: <Widget>[
          PreferredSize(
            preferredSize: const Size.fromHeight(220),
            child: headerDrawer,
          ),
          ...appMenuScreensItems.map((menuItem) {
            return (menuItem.children == null)
                ? CustomCupertinoListTile(
                    selected: selectedOption == menuItem.id,
                    menuItem: menuItem,
                    handlerNavigation: handlerNavigation,
                    pageContext: pageContext,
                  )
                : ExpandableCupertinoListTile(
                    startOpened: menuItem.children!.any(
                      (child) => child.id == selectedOption,
                    ),
                    menuItem: menuItem,
                    expandedContent: Column(
                      children: menuItem.children!.map((childItem) {
                        return CustomCupertinoListTile(
                          subItem: true,
                          selected: selectedOption == childItem.id,
                          menuItem: childItem,
                          handlerNavigation: handlerNavigation,
                          pageContext: pageContext,
                        );
                      }).toList(),
                    ),
                  );
          }),
          // Other section
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

          ...appMenuOthers.map((menuItem) {
            return CustomCupertinoListTile(
              selected: selectedOption == menuItem.id,
              menuItem: menuItem,
              handlerNavigation: handlerNavigation,
              pageContext: pageContext,
            );
          }),
          const Divider(color: Color.fromRGBO(158, 158, 158, 0.4)),
          ...appMenufinalItems.map((menuItem) {
            return CustomCupertinoListTile(
              selected: selectedOption == menuItem.id,
              menuItem: menuItem,
              handlerNavigation: handlerNavigation,
              pageContext: pageContext,
            );
          }),
        ],
      ),
    );
  }
}
