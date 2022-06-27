import 'package:flutter/material.dart';
import 'package:test_animated_nested_bottom/core/custom_scaffold.dart';

class Screen2 extends StatelessWidget {
  static const String routeName = '/screen2';
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Screen2',
      body: Center(
        child: Text('Screen2'),
      ),
    );
  }
}
