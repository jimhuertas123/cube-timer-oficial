import 'package:cube_timer_oficial/core/constants/constants.dart';
import 'package:cube_timer_oficial/features/menu_content/android_drawer.dart';
import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:cube_timer_oficial/shared/widgets/bottom_nav_bar/android_bottom_nav_bar.dart';
import 'package:cube_timer_oficial/shared/theme/app_theme.dart';
import 'package:cube_timer_oficial/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<ScaffoldState> scaffoldKeyAndroid = GlobalKey<ScaffoldState>();

///It is the main screen of the app
///in contains the appBar, body and bottom navigation bar
class TrainerAndroidPage extends ConsumerStatefulWidget {
  final CubeType selectedCubeType;
  final TrainerType type;

  const TrainerAndroidPage({
    super.key,
    required this.selectedCubeType,
    required this.type,
  });
  // final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  ConsumerState<TrainerAndroidPage> createState() => _TrainerAndroidPageState();
}

class _TrainerAndroidPageState extends ConsumerState<TrainerAndroidPage> {
  int indexPage = 0;
  final PageController pageController = PageController(keepPage: true);

  @override
  Widget build(BuildContext context) {
    final textColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
    final navbarBackgroundColor =
        Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
        Colors.white;
    bool isTimeRunning = false;
    final isDarkmode = Theme.of(context).brightness == Brightness.dark;
    final colorBackgroundPair = ColorBackgroundPair(
      primaryColor: Theme.of(context).primaryColor,
      secondaryColor: Theme.of(context).scaffoldBackgroundColor,
    );

    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        drawer: DrawerHome(),
        key: scaffoldKeyAndroid,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorBackgroundPair.primaryColor,
                    colorBackgroundPair.secondaryColor,
                  ],
                  stops: [0.05, 0.95],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 8),
                AppBarHome(
                  actualPageIndex: indexPage,
                  isTimeRunning: isTimeRunning,
                  onConfigTabPressed: () =>
                      scaffoldKeyAndroid.currentState?.openDrawer(),
                  onTitlePressed: () => showDialog(
                    context: context,
                    builder: (context) => CustomAlertDialog(
                      enableHeight: true,
                      height: 220,
                      // height: 360,
                      tittleContent: Container(
                        padding: const EdgeInsets.only(top: 5, bottom: 0),
                        child: Center(
                          child: Text(
                            "Select a puzzle",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Quicksand',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      context: context,
                      insetPadding: const EdgeInsets.symmetric(horizontal: 38),
                      contentPadding: const EdgeInsets.only(
                        right: 0,
                        left: 0,
                        top: 0,
                        bottom: 0,
                      ),
                      content: <Widget>[PuzzleSelection()],
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: [
                      Center(child: Text("1")),
                      Center(child: Text("2")),
                      Center(child: Text("3")),
                    ],
                    onPageChanged: (idx) {
                      setState(() {
                        indexPage = idx;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: indexPage == 0 || indexPage == 1 || indexPage == 2
            ? BottomNavBarAndroid(
                actualIndexPage: indexPage,
                activeIconColor: textColor,
                backgroundColor: navbarBackgroundColor,
                inactiveIconColor: !isDarkmode
                    ? Colors.black54
                    : Colors.white54,
                isTimerRunning: isTimeRunning,
                onTap: (idx) {
                  pageController.jumpToPage(idx);
                  setState(() {
                    indexPage = idx;
                  });
                },
                pageController: pageController,
              )
            : null,
      ),
    );
  }
}
