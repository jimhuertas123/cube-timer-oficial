import 'package:cube_timer_oficial/shared/providers/theme_providers/theme.provider.dart';
import 'package:cube_timer_oficial/shared/theme/theme.dart';
import 'package:cube_timer_oficial/shared/widgets/show_dialogs/custom_show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/text_theme_container.dart';
import 'widgets/theme_container.dart';

class AppThemeDialog extends StatelessWidget {
  const AppThemeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      enableHeight: true,
      tittle: 'App theme',
      fontTittleSize: 20.0,
      context: context,
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      contentPadding: const EdgeInsets.only(
        right: 0,
        left: 0,
        top: 15,
        bottom: 0,
      ),
      content: const <Widget>[ThemeChange()],
    );
  }
}

class ThemeChange extends ConsumerWidget {
  const ThemeChange({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int halfSize = (appColorTheme.length / 2).round();
    final actualThemeIndex = ref.watch(themeNotifierProvider);

    return Column(
      children: <Widget>[
        themeSection(halfSize, ref),
        Container(
          color: const Color.fromRGBO(242, 242, 242, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                height: 45,
                child: const Text(
                  "Text style",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                height: 45,
                child: const Icon(
                  Icons.text_fields_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        // textStyleSection(appColorTheme[actualThemeIndex].patternColor, ref),
      ],
    );
  }

  Widget themeSection(int halfSize, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 7),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: <Widget>[
            _themeType(0, halfSize, ref),
            const SizedBox(height: 10),
            _themeType(halfSize, appColorTheme.length, ref),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _themeType(int start, int end, WidgetRef ref) {
    final int actualAppColorThemeIndex = 0;
    // final int actualAppColorThemeIndex = ref
    //     .watch(themeNotifierProvider)
    //     .actualThemeIndex;
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
                // if (actualIndex != actualAppColorThemeIndex) {
                //   ref
                //       .read(themeNotifierProvider.notifier)
                //       .changeThemeColorIndex(actualIndex);
                // }
              },
            ),
          );
        }).values,
      ],
    );
  }

  Widget textStyleSection(ColorBackgroundPair colorTheme, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(left: 7),
      width: double.infinity,
      height: 180,
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
              return _textType(start, end, ref);
            }),
          ],
        ),
      ),
    );
  }

  Widget _textType(int start, int end, WidgetRef ref) {
    final int actualIndexTextColor = 0;
    // final int actualIndexTextColor = ref
    //     .watch(themeNotifierProvider)
    //     .actualTextThemeIndex;
    // final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkmode;
    final bool isDarkMode = true;
    return Column(
      children: <Widget>[
        ...appTextTheme.sublist(start, end).asMap().map((index, textTheme) {
          final int actualIndex = index + start;
          return MapEntry(
            actualIndex,
            TextThemeContainer(
              name: textTheme.name,
              textColor: actualIndexTextColor == 0
                  ? isDarkMode
                        ? Colors.black
                        : Colors.white
                  : appTextTheme[actualIndexTextColor].colorText ??
                        Colors.black,
              color: actualIndex == 0
                  ? isDarkMode
                        ? Colors.black
                        : Colors.white
                  : textTheme.colorText ?? Colors.blueAccent,
              borderColor: actualIndexTextColor == 0
                  ? isDarkMode
                        ? Colors.black
                        : Colors.white
                  : appTextTheme[actualIndexTextColor].colorText ??
                        Colors.black,
              isSelected: (actualIndexTextColor == actualIndex) ? true : false,
              onTap: () {
                // if (actualIndex != actualIndexTextColor) {
                //   ref
                //       .read(themeNotifierProvider.notifier)
                //       .changeTextColorIndex(actualIndex);
                // }
              },
            ),
          );
        }).values,
      ],
    );
  }

  @Deprecated("textType is deprecated, use _textType instead")
  Widget textType(ref) {
    final int actualTextColorTheme = ref
        .watch(themeNotifierProvider)
        .indexTextColor;
    final bool isDarkmode = ref.watch(themeNotifierProvider).isDarkmode;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: appTextTheme.length,
      itemBuilder: (_, index) {
        return TextThemeContainer(
          name: appTextTheme[index].name,
          textColor: (isDarkmode) ? Colors.black : Colors.white,
          color: (index == 0)
              ? (isDarkmode)
                    ? Colors.black
                    : Colors.white
              : appTextTheme[index].colorText ?? Colors.blueAccent,
          borderColor: (isDarkmode) ? Colors.black : Colors.white,
          isSelected: (actualTextColorTheme == index) ? true : false,
          onTap: () {
            ref
                .read(themeNotifierProvider.notifier)
                .changeTextColorIndex(index);
          },
        );
      },
    );
  }
}
