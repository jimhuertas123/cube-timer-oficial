import 'package:flutter/material.dart';

class CronometerAnimations {
  late AnimationController animationController;
  late AnimationController animationTimeBrokedController;
  late Animation<double> circleScaleAnimation;
  late Animation<double> circleOpacityAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> buttonScaleAnimation;

  void init(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 1000),
      vsync: vsync,
    );
    animationTimeBrokedController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      reverseDuration: const Duration(milliseconds: 0),
      vsync: vsync,
    );
    circleScaleAnimation = Tween<double>(begin: 0.5, end: 5.0).animate(
      CurvedAnimation(
        parent: animationTimeBrokedController,
        curve: Curves.easeInOut,
      ),
    );
    scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    buttonScaleAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    circleOpacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationTimeBrokedController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void dispose() {
    animationController.dispose();
    animationTimeBrokedController.dispose();
  }
}
