import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBarIos extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color backgroundColor;
  final List<IconData> icons;
  final double height;
  final double iconSize;
  final Color activeColor;
  final Color inactiveColor;
  final bool isTimerRunning;

  const BottomNavBarIos({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.backgroundColor,
    required this.icons,
    required this.isTimerRunning,
    this.height = 65,
    this.iconSize = 26,
    this.activeColor = CupertinoColors.activeBlue,
    this.inactiveColor = CupertinoColors.inactiveGray,
  });

  @override
  State<BottomNavBarIos> createState() => _BottomNavBarIosState();
}

class _BottomNavBarIosState extends State<BottomNavBarIos>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(0, 1))
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isTimerRunning) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    double paddingBottom = MediaQuery.of(context).padding.bottom - 10;

    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          padding: EdgeInsets.only(bottom: max(0, paddingBottom)),
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(widget.icons.length, (index) {
              final isActive = index == widget.currentIndex;
              return GestureDetector(
                onTap: () => widget.onTap(index),
                child: Icon(
                  widget.icons[index],
                  size: widget.iconSize,
                  color: isActive ? widget.activeColor : widget.inactiveColor,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
