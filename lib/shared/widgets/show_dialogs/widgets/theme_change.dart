import 'package:cube_timer_oficial/shared/providers/theme_providers/theme.provider.dart';
import 'package:cube_timer_oficial/shared/theme/app_theme.dart';
import 'package:cube_timer_oficial/shared/widgets/show_dialogs/widgets/text_theme_container.dart';
import 'package:cube_timer_oficial/shared/widgets/show_dialogs/widgets/theme_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeChange extends ConsumerWidget {
  const ThemeChange({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int halfSize = (appColorTheme.length / 2).round();
    final themeStateAsync = ref.watch(themeNotifierProvider);
    ThemeState themeState = ThemeState(
      actualThemeIndex: -1,
      actualTextThemeIndex: -1,
      isDarkmode: true,
      statusBarTextColor: Brightness.light,
    );

    themeStateAsync.whenData((state) {
      themeState = state;
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 17),
        Text(
          'App theme',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            wordSpacing: 0,
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 27),
        SizedBox(
          height: MediaQuery.of(context).size.height <= 455
              ? MediaQuery.of(context).size.height - 100
              : 455,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: <Widget>[
                themeSection(
                  halfSize: halfSize,
                  ref: ref,
                  themeState: themeState,
                ),
                Container(
                  color: Color(0xFFf5f5f5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 25),
                        alignment: Alignment.centerLeft,
                        height: 40,
                        child: const Text(
                          "Text style",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: const Icon(
                          Icons.text_fields_outlined,
                          color: Colors.black,
                          size: 27,
                        ),
                      ),
                    ],
                  ),
                ),
                textStyleSection(
                  colorTheme: themeState.actualThemeIndex == -1
                      ? null
                      : appColorTheme[themeState.actualThemeIndex]
                            .bgPatternColor,
                  ref: ref,
                  actualIndexTextColor: themeState.actualTextThemeIndex,
                  isDarkMode: themeState.isDarkmode,
                  context: context,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget themeSection({
    required int halfSize,
    required WidgetRef ref,
    required ThemeState themeState,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: <Widget>[
            _themeType(
              start: 0,
              end: halfSize,
              ref: ref,
              actualAppColorThemeIndex: themeState.actualThemeIndex,
            ),
            const SizedBox(height: 10),
            _themeType(
              start: halfSize,
              end: appColorTheme.length,
              ref: ref,
              actualAppColorThemeIndex: themeState.actualThemeIndex,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _themeType({
    required int start,
    required int end,
    required WidgetRef ref,
    required int actualAppColorThemeIndex,
  }) {
    return Row(
      children: <Widget>[
        ...appColorTheme.sublist(start, end).asMap().map((index, colorArrText) {
          final int actualIndex = index + start;
          return MapEntry(
            actualIndex,
            ThemeContainer(
              isSelected: (actualAppColorThemeIndex == actualIndex)
                  ? true
                  : false,
              colors: appColorTheme[actualIndex].bgPatternColor,
              tittle: appColorTheme[actualIndex].name,
              backgroundTextColor: Colors.transparent,
              onTap: () {
                if (actualIndex != actualAppColorThemeIndex) {
                  ref
                      .read(themeNotifierProvider.notifier)
                      .setThemeIndex(actualIndex);
                }
              },
            ),
          );
        }).values,
      ],
    );
  }

  Widget textStyleSection({
    required ColorBackgroundPair? colorTheme,
    required WidgetRef ref,
    required int actualIndexTextColor,
    required bool isDarkMode,
    required BuildContext context,
  }) {
    if (colorTheme == null) {
      return Container(
        padding: const EdgeInsets.only(left: 7),
        height: 192,
        width: double.infinity,
      );
    }

    return Container(
      padding: const EdgeInsets.only(left: 4, top: 7),
      width: double.infinity,
      height: 192,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [colorTheme.primaryColor, colorTheme.secondaryColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      // child: _textType2(ref));
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            ...List.generate((appTextTheme.length / 2).ceil(), (index) {
              int start = index * 2;
              int end = (start + 2 > appTextTheme.length)
                  ? appTextTheme.length
                  : start + 2;
              return _textType(
                start: start,
                end: end,
                ref: ref,
                actualIndexTextColor: actualIndexTextColor,
                isDarkMode: isDarkMode,
                context: context,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _textType({
    required int start,
    required int end,
    required WidgetRef ref,
    required int actualIndexTextColor,
    required bool isDarkMode,
    required BuildContext context,
  }) {
    return Column(
      children: <Widget>[
        ...appTextTheme.sublist(start, end).asMap().map((index, textTheme) {
          final int actualIndex = index + start;
          return MapEntry(
            actualIndex,
            TextThemeContainer(
              name: textTheme.name,
              textColor: actualIndexTextColor == 0
                  ? Theme.of(context).textTheme.bodyMedium?.color ??
                        Colors.black
                  : appTextTheme[actualIndexTextColor].colorText ??
                        Colors.black,
              color: actualIndex == 0
                  ? isDarkMode
                        ? Colors.white
                        : Colors.black
                  : textTheme.colorText ?? Colors.blueAccent,
              borderColor: actualIndexTextColor == 0
                  ? isDarkMode
                        ? Colors.white
                        : Colors.black
                  : appTextTheme[actualIndexTextColor].colorText ??
                        Colors.black,
              isSelected: (actualIndexTextColor == actualIndex) ? true : false,
              onTap: () {
                if (actualIndex != actualIndexTextColor) {
                  ref
                      .read(themeNotifierProvider.notifier)
                      .setTextThemeIndex(actualIndex);
                }
              },
            ),
          );
        }).values,
      ],
    );
  }
}
