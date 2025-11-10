import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class IosAboutPage extends StatelessWidget {
  const IosAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Column(children: [Text('iOS About Page Content')]),
    );
  }
}
