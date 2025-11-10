import 'package:flutter/material.dart';

import '../widgets/theme_change.dart';

void showAppThemeDialog(BuildContext context) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) => Center(
      child: Container(
        width: 360,
        constraints: BoxConstraints(minWidth: 360, maxWidth: 360),
        margin: const EdgeInsets.symmetric(horizontal: 36, vertical: 0),
        // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ThemeChange(),
      ),
    ),
  );
}
