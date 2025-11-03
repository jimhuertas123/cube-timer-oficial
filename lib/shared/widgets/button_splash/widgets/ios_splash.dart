import 'package:cube_timer_oficial/core/constants/icons/mode_cube_icons.dart';
import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:cube_timer_oficial/features/timer/presentation/helpers/label_cube_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// **IOS**: animation IOS scale entire button with animation container (still pending).
/// didnt exist original animation, but agree making it like long press animation in ios
/// splash oversize scaling the entire button.
class IOSButtonSplash extends ConsumerStatefulWidget {
  final int id;
  final CubeType cubeType;
  final void Function(int id) onPress;

  const IOSButtonSplash({
    super.key,
    required this.id,
    required this.cubeType,
    required this.onPress,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IOSButtonSplashState();
}

class _IOSButtonSplashState extends ConsumerState<IOSButtonSplash>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final AnimationController _scaleController;
  bool isActive = false;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: -0.1,
      end: 0.1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _startAnimation(int index) {
    setState(() => isActive = true);
    _scaleController.forward();
    _controller.repeat(reverse: true);
  }

  void _stopAnimation() {
    setState(() => isActive = false);
    _controller.stop();
    _scaleController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size.width;
    final iconListIndex = widget.cubeType.id - 1;
    return GestureDetector(
      onTap: () => widget.onPress(widget.id),
      onLongPressStart: (_) {
        _startAnimation(widget.id);
      },
      onLongPressEnd: (_) {
        isActive = false;
        _stopAnimation();
        widget.onPress(widget.id);
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateZ(isActive ? _animation.value : 0.0),
            child: ScaleTransition(
              scale: isActive
                  ? Tween<double>(begin: 1.0, end: 1.2).animate(
                      CurvedAnimation(
                        parent: _scaleController,
                        curve: Curves.easeInOut,
                      ),
                    )
                  : const AlwaysStoppedAnimation(1.0),
              child: Container(
                width: (screen < 500) ? screen / 3.5 : 133,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    iconList[iconListIndex],
                    const SizedBox(height: 15),
                    Text(
                      '${labelCubeType(widget.cubeType.type)} Cube',
                      style: const TextStyle(
                        fontSize: 12,
                        color: CupertinoColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
