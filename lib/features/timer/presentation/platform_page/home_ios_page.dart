import 'package:cube_timer_oficial/features/menu_content/menu_content.dart';
import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:cube_timer_oficial/shared/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cube_timer_oficial/features/timer/presentation/subpages/subpages.dart';
import 'package:cube_timer_oficial/shared/widgets/bottom_nav_bar/ios_bottom_nav_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

final GlobalKey<ScaffoldState> scaffoldKeyIos = GlobalKey<ScaffoldState>();

class TimerIOSPage extends ConsumerStatefulWidget {
  final CubeType selectedCubeType;

  const TimerIOSPage({super.key, required this.selectedCubeType});

  @override
  ConsumerState<TimerIOSPage> createState() => _TimerIOSPageState();
}

class _TimerIOSPageState extends ConsumerState<TimerIOSPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isTimeRunning = ref.watch(timerRunningProvider).isRunning;
    final cupertinoTheme = ref.watch(cupertinoThemeProvider);
    final gradientColors = cupertinoTheme.gradientColors;
    final Color textColor =
        cupertinoTheme.themeData.textTheme.textStyle.color ??
        CupertinoColors.black;
    final isDarkmode = cupertinoTheme.themeData.brightness == Brightness.dark;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBarHome(
            actualPageIndex: _selectedIndex,
            isTimeRunning: isTimeRunning,
            onConfigTabPressed: () => showCupertinoModalBottomSheet(
              context: context,
              builder: (context) => MenuBottomModal(
                title: 'Settings',
                pageContext: context,
                // child: CupertinoButton(
                //   child: Text('Open Second Modal'),
                //   onPressed: () {
                //     //close the modal
                //     Navigator.of(context).pop();
                //     // showCupertinoModalBottomSheet(
                //     //   context: context,
                //     //   builder: (context) => CupertinoPageScaffold(
                //     //     navigationBar: CupertinoNavigationBar(
                //     //       middle: Text('Second Modal'),
                //     //     ),
                //     //     child: Center(
                //     //       child: Text('This is the second modal '),
                //     //     ),
                //     //   ),
                //     // );
                //   },
                // ),
                // )
              ),
            ),
            onTitlePressed: () => showCupertinoDialog(
              barrierDismissible: true,
              barrierColor: CupertinoColors.black.withAlpha(80),
              context: context,
              builder: (context) => Center(
                child: Container(
                  width: 400,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 0,
                  ),
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Select a puzzle',
                        style: TextStyle(
                          color: CupertinoColors.black,
                          fontFamily: 'Quicksand',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      PuzzleSelection(),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SafeArea(
          top: true,
          bottom: true,
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Animate padding when isTimeRunning changes
              return AnimatedPadding(
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeInOut,
                padding: isTimeRunning
                    ? EdgeInsets.zero
                    : const EdgeInsets.only(top: 70.0, bottom: 40.0),
                child: SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: _selectedIndex == 0
                      ? CronometerSubpage(height: constraints.maxHeight)
                      : _selectedIndex == 1
                      ? TimesSubpage()
                      : StatisticsSubpage(),
                ),
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: BottomNavBarIos(
            isTimerRunning: isTimeRunning,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            activeColor: textColor,
            inactiveColor: !isDarkmode ? Colors.black54 : Colors.white54,
            backgroundColor: cupertinoTheme.bottomAppbarColor,
            icons: const [
              CupertinoIcons.stopwatch,
              CupertinoIcons.square_list,
              CupertinoIcons.chart_bar,
            ],
          ),
        ),
      ],
    );
  }
}
