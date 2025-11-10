import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'package:cube_timer_oficial/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeContainer extends StatelessWidget {
  final ColorBackgroundPair colors;
  final String tittle;
  final bool isSelected;
  final Color backgroundTextColor;
  final void Function()? onTap;

  const ThemeContainer({
    super.key,
    required this.isSelected,
    required this.colors,
    required this.onTap,
    required this.backgroundTextColor,
    required this.tittle,
  });

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(left: 0, right: 0),
          width: 40.0,
          height: 60.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colors.primaryColor, colors.secondaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.black, width: 0.5),
          ),
        ),
      ),
      const SizedBox(height: 7.0),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        width: 60,
        decoration: BoxDecoration(
          color: backgroundTextColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          decoration: (isSelected)
              ? BoxDecoration(
                  color: const Color.fromRGBO(255, 239, 143, 1),
                  borderRadius: BorderRadius.circular(7.0),
                  border: Border.all(
                    color: const Color.fromRGBO(255, 236, 80, 1),
                    width: 1.0,
                  ),
                )
              : null,
          padding: isIOSDevice
              ? const EdgeInsets.only(top: 2)
              : EdgeInsets.zero,
          width: 8.0,
          height: 35,
          child: Text(
            tittle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: "Quicksand",
              color: Colors.black,
              fontSize: 11.0,
              wordSpacing: 0,
              height: 1.3,
            ),
          ),
        ),
      ),
    ],
  );
}
