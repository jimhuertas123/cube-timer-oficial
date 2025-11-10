import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'package:flutter/material.dart';

class TextThemeContainer extends StatelessWidget {
  final Color borderColor;
  final bool isSelected;
  final Color textColor;
  final Color color;
  final String name;
  final void Function()? onTap;

  const TextThemeContainer({
    super.key,
    required this.name,
    required this.textColor,
    required this.color,
    required this.borderColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(left: 6, right: 7, top: 7),
            width: 50,
            height: 44,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 0.7),
                borderRadius: BorderRadius.circular(9.0),
                color: Colors.transparent,
              ),
              child: Center(
                child: Text(
                  'Aa',
                  style: TextStyle(
                    color: color,
                    fontSize: isAndroidDevice ? 22 : 25.0,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        FittedBox(
          fit: BoxFit.fitHeight,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            margin: const EdgeInsets.only(bottom: 8),
            alignment: Alignment.center,
            decoration: (isSelected)
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: const Color.fromRGBO(255, 235, 62, 1),
                    ),
                    color: const Color.fromRGBO(255, 239, 143, 1),
                  )
                : null,
            child: Text(
              name,
              style: TextStyle(
                color: (isSelected) ? Colors.black : textColor,
                fontSize: 11.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
