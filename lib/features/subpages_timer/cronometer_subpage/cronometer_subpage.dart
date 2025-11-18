// import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'dart:async';

import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'animations/cronometer_animations.dart';
import 'widgets/circle_break_record.dart';
import 'widgets/cronometer.dart';

class CronometerSubpage extends ConsumerStatefulWidget {
  final double height;
  const CronometerSubpage({super.key, required this.height});

  @override
  ConsumerState<CronometerSubpage> createState() => _CronometerSubpageState();
}

class _CronometerSubpageState extends ConsumerState<CronometerSubpage>
    with TickerProviderStateMixin {
  Timer _timer = Timer(Duration(seconds: 0), () {});
  int minutes = 0;
  int seconds = 0;
  int milliseconds = 0;
  int macroseconds = 0;
  int elapsedMs = 0;
  Offset? _targetPosition;
  Size? _targetSize;

  final CronometerAnimations cronometerAnimations = CronometerAnimations();

  void _updateTargetPosition() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? box =
          _targetKey.currentContext?.findRenderObject() as RenderBox?;
      if (box != null && mounted) {
        setState(() {
          _targetPosition = box.localToGlobal(Offset.zero);
          _targetSize = box.size;
        });
        debugPrint('Posición: $_targetPosition, Tamaño: $_targetSize');
      }
    });
  }

  void _updateBrokedRecord() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(timerRunningProvider.notifier).setBreakRecord(false);
    });
  }

  void startTimer(bool isRunning) {
    if (isRunning) {
      setState(() {
        isRunning = false;
        _timer.cancel();
        cronometerAnimations.animationController.reverse();
        cronometerAnimations.animationTimeBrokedController.forward();
      });
      return;
    }
    isRunning = true;
    elapsedMs = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        elapsedMs += 10;
      });
    });
    cronometerAnimations.animationController.forward();
    cronometerAnimations.animationTimeBrokedController.reverse();
  }

  @override
  void initState() {
    super.initState();
    cronometerAnimations.init(this);
    _updateTargetPosition();
    _updateBrokedRecord();
  }

  @override
  void dispose() {
    _timer.cancel();
    cronometerAnimations.dispose();
    super.dispose();
  }

  //for showing new average message
  final GlobalKey _targetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final isTimeRunning = ref.watch(timerRunningProvider).isRunning;
    final breakRecord = ref.watch(timerRunningProvider).breakRecord;

    return GestureDetector(
      onTap: () {
        ref.read(timerRunningProvider.notifier).toggle();
        ref.read(timerRunningProvider.notifier).setBreakRecord(true);
        debugPrint("isRunning: $isTimeRunning");
        startTimer(isTimeRunning);
      },
      child: Stack(
        children: [
          CircleBreakRecord(
            breakNewRecord: breakRecord,
            containerHeight: widget.height,
            circleScaleAnimation: cronometerAnimations.circleScaleAnimation,
            circleOpacityAnimation: cronometerAnimations.circleOpacityAnimation,
            isTimeRunning: isTimeRunning,
          ),
          Column(
            children: [
              Visibility(
                visible: !isTimeRunning,
                child: Container(height: 50, color: CupertinoColors.systemRed),
              ),
              Expanded(
                child: Container(
                  color: CupertinoColors.transparent,
                  child: CronometerTime(
                    scaleAnimation: cronometerAnimations.scaleAnimation,
                    buttonScaleAnimation:
                        cronometerAnimations.buttonScaleAnimation,
                    textColor: CupertinoColors.systemBackground,
                    isTimerRunning: isTimeRunning,
                    breakNewRecord: breakRecord,
                    containerHeight: widget.height,
                    elapsedMs: elapsedMs,
                    fontSize: widget.height > 400 ? 100 : 100 * 0.6,
                  ),
                ),
              ),
              Visibility(
                visible: !isTimeRunning,
                child: Container(
                  height: 100,
                  color: CupertinoColors.systemBlue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
