import 'package:cube_timer_oficial/core/constants/constants.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:flutter/material.dart';

class ListTileContent extends StatelessWidget {
  final MenuItem menuItem;
  final bool selected;
  final int selectedOption;
  final BuildContext parentContext;
  final NavigationHandler handlerNavigation;
  const ListTileContent({
    super.key,
    required this.menuItem,
    required this.selected,
    required this.selectedOption,
    required this.parentContext,
    required this.handlerNavigation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: selected
            ? const Color.fromRGBO(96, 164, 219, 0.13)
            : Colors.transparent,
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        contentPadding: const EdgeInsets.only(left: 8.0),
        key: Key(menuItem.id.toString()),
        selected: selected,
        selectedColor: const Color(0xFF4aa8ef),
        textColor: Colors.black87,
        title: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text(
            menuItem.title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'Arial',
              fontSize: 15.0,
            ),
          ),
        ),
        leading: Icon(
          menuItem.icon,
          color: selected ? const Color(0xFF4aa8ef) : const Color(0xff767676),
        ),
        dense: true,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -3),
        onTap: () {
          Navigator.of(context).pop();
          if (menuItem.id != selectedOption) {
            handlerNavigation(menuItem.action, parentContext);
          }
        },
      ),
    );
  }
}
