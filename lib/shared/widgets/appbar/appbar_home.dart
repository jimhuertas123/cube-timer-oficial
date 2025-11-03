import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'package:cube_timer_oficial/shared/widgets/appbar/widgets/title_category.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/dialogs_content/showdialog_categories.dart';

class AppBarHome extends ConsumerWidget {
  final bool isTimeRunning;
  final int actualPageIndex;
  final bool hideActions;
  final VoidCallback? onConfigTabPressed;
  final VoidCallback? onTitlePressed;

  const AppBarHome({
    super.key,
    required this.isTimeRunning,
    required this.actualPageIndex,
    this.hideActions = false,
    this.onConfigTabPressed,
    this.onTitlePressed,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCubeType = ref.watch(selectedCubeTypeProvider);
    return selectedCubeType.when(
      data: (cubeType) => AppBarHomeData(
        isTimeRunning: isTimeRunning,
        actualPageIndex: actualPageIndex,
        onConfigTabPressed: onConfigTabPressed ?? () {},
        onTitlePressed: onTitlePressed ?? () {},
        selectedCubeType: cubeType ?? CubeType(id: 1, type: '3x3'),
        hideActions: hideActions,
      ),
      loading: () => const SizedBox(
        width: 18,
        height: 18,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
      error: (e, st) => const Icon(Icons.error, color: Colors.red),
    );
  }
}

class AppBarHomeData extends ConsumerStatefulWidget {
  final CubeType selectedCubeType;
  final bool isTimeRunning;
  final int actualPageIndex;
  final VoidCallback onConfigTabPressed;
  final VoidCallback onTitlePressed;
  final bool hideActions;

  const AppBarHomeData({
    super.key,
    required this.isTimeRunning,
    required this.onConfigTabPressed,
    required this.actualPageIndex,
    required this.onTitlePressed,
    required this.selectedCubeType,
    this.hideActions = false,
  });

  @override
  ConsumerState<AppBarHomeData> createState() => _AppBarHomeDataState();
}

class _AppBarHomeDataState extends ConsumerState<AppBarHomeData>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  bool isRotated = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _slideAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, -1)).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isTimeRunning) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    final cupertinoTheme = ref.watch(cupertinoThemeProvider);
    final themeData = cupertinoTheme.themeData;

    final Color appBarBgColor = themeData.barBackgroundColor;
    final Color textColor =
        themeData.textTheme.textStyle.color ?? CupertinoColors.black;

    return SafeArea(
      top: true,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: isAndroidDevice ? 6.0 : 8.0,
            ),
            decoration: BoxDecoration(
              color: appBarBgColor,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  spreadRadius: 0.3,
                  blurRadius: 2.5,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                left: isAndroidDevice ? 4.0 : 5.0,
                top: isAndroidDevice ? 2.0 : 8.0,
                bottom: isAndroidDevice ? 2.0 : 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: isAndroidDevice ? 53 : 60,
                    child: IconButton(
                      icon: Icon(
                        isAndroidDevice
                            ? Icons.settings_outlined
                            : CupertinoIcons.settings_solid,
                        color: textColor,
                        size: isAndroidDevice ? 24.0 : 25.0,
                      ),
                      onPressed: widget.onConfigTabPressed,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: widget.onTitlePressed,
                      child: TitleCategory(textColor: textColor),
                    ),
                  ),
                  Row(
                    children: [
                      Visibility(
                        replacement: SizedBox(width: 40.0),
                        visible: widget.actualPageIndex != 0,
                        child: SizedBox(
                          width: 35.0,
                          child: IconButton(
                            iconSize: 22.0,
                            icon: AnimatedRotation(
                              turns: isRotated ? 5 / 6 : 0,
                              duration: const Duration(milliseconds: 200),
                              child: isAndroidDevice
                                  ? Icon(
                                      color: textColor,
                                      isRotated
                                          ? Icons.hourglass_full_outlined
                                          : Icons.hourglass_empty_outlined,
                                    )
                                  : Icon(
                                      color: CupertinoColors.white,
                                      isRotated
                                          ? CupertinoIcons
                                                .hourglass_bottomhalf_fill
                                          : CupertinoIcons.hourglass,
                                    ),
                            ),
                            onPressed: () {
                              setState(() {
                                isRotated = !isRotated;
                              });
                            },
                          ),
                        ),
                      ),
                      Visibility(
                        visible: !widget.hideActions,
                        child: Container(
                          alignment: Alignment.center,
                          width: 35.0,
                          child: IconButton(
                            iconSize: 25.0,
                            icon: Icon(
                              Icons.category_outlined,
                              color: textColor,
                            ),
                            onPressed: () => isAndroidDevice
                                ? showDialog(
                                    context: context,
                                    builder: (context) =>
                                        ShowDialogCategories(),
                                  )
                                : showCupertinoDialog(
                                    barrierDismissible: true,
                                    barrierColor: CupertinoColors.black
                                        .withAlpha(80),
                                    context: context,
                                    builder: (context) =>
                                        ShowDialogCategories(),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
