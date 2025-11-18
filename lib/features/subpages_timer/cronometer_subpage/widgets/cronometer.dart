import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CronometerTime extends StatelessWidget {
  const CronometerTime({
    super.key,
    required this.textColor,
    required this.isTimerRunning,
    required this.elapsedMs,
    required this.fontSize,
    required this.breakNewRecord,
    required this.buttonScaleAnimation,
    required this.scaleAnimation,
    required this.containerHeight,
  });

  final double fontSize;
  final double containerHeight;
  final bool isTimerRunning;
  final bool breakNewRecord;
  final Color textColor;
  final Animation<double> buttonScaleAnimation;
  final Animation<double> scaleAnimation;
  final int elapsedMs;

  @override
  Widget build(BuildContext context) {
    final int minutes = (elapsedMs ~/ 60000);
    final int seconds = ((elapsedMs ~/ 1000) % 60);
    final int centiseconds = ((elapsedMs ~/ 10) % 100);

    return Container(
      padding: EdgeInsets.only(bottom: 73),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          !isTimerRunning && breakNewRecord && containerHeight > 400
              ? SizedBox(
                  height: 90,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      !isTimerRunning && breakNewRecord && containerHeight > 400
                          ? "Congratulations! ${containerHeight > 400 ? '\n' : ''} You've just beaten your previous personal best by ${containerHeight > 400 ? '\n' : ''} 12.23"
                          : '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : SizedBox(height: containerHeight > 400 ? 90 : 0),

          /////////////////////////////////
          ///Cronometer timing animation///
          /////////////////////////////////
          if (Platform.isIOS) SizedBox(height: containerHeight > 400 ? 90 : 0),

          containerHeight > 400
              ? _cronometer(minutes, seconds, centiseconds)
              : Expanded(child: _cronometer(minutes, seconds, centiseconds)),

          /////////////////////////////////////////
          //buttons in case of breaking best time//
          /////////////////////////////////////////
          Container(
            height: containerHeight > 400 ? 40 : 35,
            margin: EdgeInsets.only(top: containerHeight > 400 ? 3 : 0),
            child: ScaleTransition(
              scale: buttonScaleAnimation,
              child: Visibility(
                visible: !isTimerRunning && breakNewRecord,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Platform.isIOS
                            ? CupertinoIcons.xmark
                            : Icons.close_rounded,
                        // Icons.edit_outlined,
                        color: textColor,
                        size: Platform.isIOS ? 20 : 24,
                      ),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      onPressed: () {
                        debugPrint("Xmark");
                      },
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(
                        Platform.isIOS
                            ? CupertinoIcons.slash_circle
                            : Icons.block_outlined,
                        color: textColor,
                        size: Platform.isIOS ? 20 : 22,
                      ),
                      onPressed: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(
                        // Icons.autorenew,
                        Platform.isIOS
                            ? CupertinoIcons.flag
                            : Icons.flag_outlined,
                        color: textColor,
                        size: Platform.isIOS ? 20 : 22,
                      ),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      onPressed: () {},
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      icon: Icon(
                        // Icons.autorenew,
                        Platform.isIOS
                            ? CupertinoIcons.text_bubble
                            : Icons.add_comment_outlined,
                        color: textColor,
                        size: Platform.isIOS ? 20 : 22,
                      ),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ScaleTransition _cronometer(int minutes, int seconds, int milliseconds) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Visibility(
            visible: elapsedMs > 60000,
            child: Text(
              "$minutes:",
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: fontSize,
                color: textColor,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
          ),
          Text(
            seconds < 10
                ? minutes == 0
                      ? "$seconds"
                      : "0$seconds"
                : "$seconds",
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: fontSize,
              color: textColor,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
            textAlign: TextAlign.end,
          ),
          Text(
            milliseconds > 9 ? ".$milliseconds" : ".0$milliseconds",
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: fontSize * 0.75,
              color: textColor,
              fontWeight: FontWeight.bold,
              height: 1.15,
            ),
          ),
        ],
      ),
    );
  }
}
