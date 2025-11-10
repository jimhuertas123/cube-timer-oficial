import 'package:cube_timer_oficial/core/constants/constants.dart';
import 'package:cube_timer_oficial/features/menu_content/widgets/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';

class ExpandableCupertinoListTile extends StatefulWidget {
  final MenuItem menuItem;
  final Widget? expandedContent;
  final bool startOpened;

  const ExpandableCupertinoListTile({
    super.key,
    required this.menuItem,
    this.expandedContent,
    this.startOpened = false,
  });

  @override
  State<ExpandableCupertinoListTile> createState() =>
      _ExpandableCupertinoListTileState();
}

class _ExpandableCupertinoListTileState
    extends State<ExpandableCupertinoListTile>
    with TickerProviderStateMixin {
  late bool _expanded;
  late final AnimationController _arrowController;
  late final Animation<double> _arrowAnimation;

  @override
  void initState() {
    super.initState();
    _expanded = widget.startOpened;
    _arrowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _arrowAnimation = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(parent: _arrowController, curve: Curves.easeInOut),
    );
    if (_expanded) {
      _arrowController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _arrowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCupertinoListTile(
          menuItem: widget.menuItem,
          selected: false,
          handlerNavigation: (action, pageContext) {},
          trailing: AnimatedBuilder(
            animation: _arrowAnimation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _arrowAnimation.value * 3.1416, // 0 to pi/2 (down to up)
                child: Icon(
                  CupertinoIcons.arrowtriangle_down_fill,
                  size: 15,
                  color:
                      CupertinoTheme.of(context).brightness == Brightness.dark
                      ? CupertinoColors.white
                      : CupertinoColors.systemGrey,
                ),
              );
            },
          ),
          pageContext: context,
          onTap: () {
            setState(() {
              _expanded = !_expanded;
              if (_expanded) {
                _arrowController.forward();
              } else {
                _arrowController.reverse();
              }
            });
          },
        ),
        AnimatedSize(
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: _expanded
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10.0,
                  ),
                  child: widget.expandedContent ?? SizedBox.shrink(),
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}
