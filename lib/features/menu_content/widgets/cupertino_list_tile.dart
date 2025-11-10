import 'package:cube_timer_oficial/core/constants/constants.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:flutter/cupertino.dart';

class CustomCupertinoListTile extends StatelessWidget {
  final NavigationHandler handlerNavigation;
  final BuildContext pageContext;
  final MenuItem menuItem;
  final bool selected;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool subItem;

  const CustomCupertinoListTile({
    super.key,
    required this.handlerNavigation,
    required this.pageContext,
    required this.menuItem,
    required this.selected,
    this.subItem = false,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: subItem ? 0 : 5.0, horizontal: 5),
      decoration: BoxDecoration(
        color: selected
            ? CupertinoTheme.of(context).brightness == Brightness.dark
                  ? CupertinoColors.activeBlue.withAlpha(90)
                  : Color(0xFFE4F2FE)
            : CupertinoColors.transparent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: CupertinoListTile(
        trailing: trailing,
        leading: Icon(
          menuItem.icon,
          color: selected
              ? Color(0xFF2196F3)
              : CupertinoTheme.of(context).brightness == Brightness.dark
              ? CupertinoColors.white
              : Color(0xFF212121),
          size: subItem ? 20 : 28,
        ),
        title: Container(
          padding: EdgeInsets.only(left: 18),
          child: Text(
            menuItem.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              color: selected
                  ? Color(0xFF2196F3)
                  : CupertinoTheme.of(context).brightness == Brightness.dark
                  ? CupertinoColors.white
                  : Color(0xFF212121),
            ),
          ),
        ),
        onTap: () {
          if (onTap != null) {
            onTap!();
            return;
          }
          Navigator.of(context).pop();
          handlerNavigation(menuItem.action, pageContext);
        },
      ),
    );
  }
}
