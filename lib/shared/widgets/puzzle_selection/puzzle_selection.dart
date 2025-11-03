import 'package:cube_timer_oficial/shared/platform_device/platform_device.dart';
import 'package:cube_timer_oficial/shared/providers/providers.dart';
import 'package:cube_timer_oficial/shared/widgets/button_splash/button_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PuzzleSelection extends ConsumerWidget {
  const PuzzleSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cubeTypes = ref.watch(cubeTypesSyncProvider);

    return GridView.builder(
      key: const Key('puzzle_selection'),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: isAndroidDevice ? 1.26 : 1.26,
      ),
      padding: EdgeInsets.only(
        top: isAndroidDevice ? 12.5 : 6,
        bottom: 6,
        left: 4.6,
        right: isAndroidDevice ? 4.6 : 10,
      ),
      itemCount: cubeTypes.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CustomButtonSplash(
          cubeType: cubeTypes[index],
          key: Key('puzzle_button_$index'),
          id: cubeTypes[index].id,
          padding: const EdgeInsets.symmetric(horizontal: 0),
        );
      },
    );

    // Row(
    //   key: const Key('puzzle_selection'),
    //   children: <Widget>[
    //     const SizedBox(height: 13),
    //     CustomButtonSplash(
    //       index: 0,
    //       padding: const EdgeInsets.symmetric(horizontal: 0),
    //     ),
    //     CustomButtonSplash(
    //       index: 1,
    //       padding: const EdgeInsets.symmetric(horizontal: 0),
    //     ),
    //     CustomButtonSplash(
    //       index: 3,
    //       padding: EdgeInsets.all(0),
    //     ),
    //     // _buttonScale(3),
    //   ],
    // );
  }
}
