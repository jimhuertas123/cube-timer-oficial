import 'package:cube_timer_oficial/core/constants/icons/mode_cube_icons.dart';
import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../features/timer/presentation/helpers/helpers.dart';

/// **ANDROID**: animation Android only splash on long press like original material design for twisty timer.
/// splash oversize container size like original twisty timer app.
class AndroidButtonSplash extends ConsumerStatefulWidget {
  final int id;
  final CubeType cubeType;
  final void Function(int id) onPress;
  final EdgeInsetsGeometry padding;
  const AndroidButtonSplash({
    super.key,
    required this.cubeType,
    required this.id,
    required this.onPress,
    required this.padding,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AndroidButtonSplashState();
}

class _AndroidButtonSplashState extends ConsumerState<AndroidButtonSplash>
    with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isTouchDisabled = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showOverlay(BuildContext context, Offset position, Size size) {
    _overlayEntry = _createOverlayEntry(context, position, size);
    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
  }

  OverlayEntry _createOverlayEntry(
    BuildContext context,
    Offset position,
    Size size,
  ) {
    return OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx - 22, // Adjust to control the splash position
        top: position.dy - 22, // Adjust to control the splash position
        width: size.width + 44, // Adjust to control the splash size
        height: size.height + 44, // Adjust to control the splash size
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(10),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _removeOverlay() async {
    if (_overlayEntry != null) {
      await _animationController.reverse().then((_) {
        _overlayEntry?.remove();
        _overlayEntry = null;
        setState(() {
          _isTouchDisabled = false;
        });
      });
    }
  }

  final GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final iconListIndex = widget.cubeType.id - 1;

    return Container(
      key: key,
      margin: widget.padding,
      child: GestureDetector(
        onTap: () => widget.onPress(widget.id),
        onLongPressStart: (details) async {
          if (!_isTouchDisabled) {
            setState(() {
              _isTouchDisabled = true;
            });
            RenderBox renderBox =
                key.currentContext!.findRenderObject() as RenderBox;
            Offset position = renderBox.localToGlobal(Offset.zero);
            Size size = renderBox.size;
            _showOverlay(context, position, size);
          }
        },
        onLongPressEnd: (details) async {
          _removeOverlay();
          widget.onPress(widget.id);
        },
        child: Container(
          width: (MediaQuery.of(context).size.width < 500)
              ? (MediaQuery.of(context).size.width) / 3.5
              : 133,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              iconList[iconListIndex],
              SizedBox(height: 7),
              Text(
                '${labelCubeType(widget.cubeType.type)} Cube',
                style: const TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 12,
                  letterSpacing: 0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
