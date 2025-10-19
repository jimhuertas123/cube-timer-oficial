import 'package:cube_timer_oficial/features/timer/data/database.dart';
import 'package:cube_timer_oficial/features/timer/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GlobalKey<ScaffoldState> scaffoldKeyIos = GlobalKey<ScaffoldState>();

class HomeIOSPage extends ConsumerWidget {
  final List<Category> categories;
  const HomeIOSPage({
    super.key,
    required this.categories
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Home')),
      child: Column(
        children: <Widget>[
          AppBarHome(
            categories: categories
          ),
        ],
      ),
    );
  }
}
