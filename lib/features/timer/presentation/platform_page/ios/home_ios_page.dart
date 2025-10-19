import 'package:cube_timer_oficial/features/timer/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<ScaffoldState> scaffoldKeyIos = GlobalKey<ScaffoldState>();

class HomeIOSPage extends ConsumerWidget {
  const HomeIOSPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    bool isTimeRunning = false;

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            AppBarHome(
              isTimeRunning: isTimeRunning
            ),
            ElevatedButton(
              onPressed: ()=>{ isTimeRunning = !isTimeRunning }, 
              child: Text('xd')
            )
          ],
        ),
      ),
    );
  }
  
}
