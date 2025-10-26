import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerAndroidPage extends ConsumerWidget{

  final List<CubeType> cubeTypes;
  final List<Category> categories;
  const TimerAndroidPage({
    super.key,
    required this.categories,
    required this.cubeTypes
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home iOS - isIOS'),
      ),
    );
  }

}
