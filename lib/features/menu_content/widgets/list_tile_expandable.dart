import 'package:cube_timer_oficial/core/constants/constants.dart';
import 'package:cube_timer_oficial/features/menu_content/widgets/list_tile_item.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:flutter/material.dart';

class ListTileExpandable extends StatelessWidget {
  final MenuItem menuItem;
  final List<MenuItem> subMenuItems;
  final int selectedOption;
  final BuildContext parentContext;
  final NavigationHandler handlerNavigation;
  const ListTileExpandable({
    super.key,
    required this.menuItem,
    required this.subMenuItems,
    required this.selectedOption,
    required this.parentContext,
    required this.handlerNavigation,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // color: const Color.fromRGBO(244, 67, 54, 0.5),
        ),
        child: ExpansionTile(
          initiallyExpanded: menuItem.id == 1
              ? selectedOption == 2 || selectedOption == 3
                    ? true
                    : false
              : menuItem.id == 4
              ? selectedOption == 5
                    ? true
                    : false
              : false,
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          visualDensity: const VisualDensity(horizontal: -4, vertical: -3.5),
          tilePadding: const EdgeInsets.only(left: 8),
          title: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              menuItem.title,
              style: const TextStyle(
                color: Colors.black87,
                fontFamily: 'Arial',
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          leading: Container(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Icon(menuItem.icon, color: Colors.black54),
          ),
          children: <Widget>[
            const SizedBox(height: 3),
            ...subMenuItems.map(
              (subItem) => ListTileItem(
                selected: selectedOption == subItem.id,
                icon: subItem.icon,
                title: subItem.title,
                key: Key(subItem.id.toString()),
                onTap: () {
                  Navigator.of(context).pop();
                  if (subItem.id != selectedOption) {
                    handlerNavigation(subItem.action, parentContext);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
