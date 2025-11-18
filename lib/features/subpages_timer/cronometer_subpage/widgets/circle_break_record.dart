import 'package:flutter/cupertino.dart';

class CircleBreakRecord extends StatelessWidget {
  final Animation<double> circleScaleAnimation;
  final Animation<double> circleOpacityAnimation;
  final bool breakNewRecord;
  final double containerHeight;
  final bool isTimeRunning;

  const CircleBreakRecord({
    super.key,
    required this.breakNewRecord,
    required this.containerHeight,
    required this.circleScaleAnimation,
    required this.circleOpacityAnimation,
    required this.isTimeRunning,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: circleScaleAnimation,
      builder: (context, child) {
        return Visibility(
          visible: !isTimeRunning && breakNewRecord,
          child: Center(
            child: Transform.scale(
              scale: circleScaleAnimation.value,
              child: Opacity(
                opacity: circleOpacityAnimation.value,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: CupertinoColors.activeGreen,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
