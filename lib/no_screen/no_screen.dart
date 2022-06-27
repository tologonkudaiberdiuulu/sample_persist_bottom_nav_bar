import 'package:flutter/material.dart';

class NoScreen extends StatelessWidget {
  static const String routeName = '/no_screen';
  const NoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NoScreen'),
      ),
      body: const Center(
        child: Text('NoScreen'),
      ),
    );
  }
}
