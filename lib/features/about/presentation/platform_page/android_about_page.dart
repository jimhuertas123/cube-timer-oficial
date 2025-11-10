import 'package:flutter/material.dart';

class AndroidAboutPage extends StatelessWidget {
  const AndroidAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Android About')),
      body: const Center(child: Text('Android Settings Page Content')),
    );
  }
}
