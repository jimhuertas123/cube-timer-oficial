import 'package:flutter/cupertino.dart';

void showDonateCupertinoDialog(BuildContext context) {
  showCupertinoDialog(
    barrierDismissible: true,
    barrierColor: CupertinoColors.black.withAlpha(80),
    context: context,
    builder: (context) => Center(
      child: Container(
        width: 360,
        constraints: BoxConstraints(minWidth: 360, maxWidth: 360),
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
        // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(),
      ),
    ),
  );
}
