import 'package:flutter/material.dart';
import 'package:test_animated_nested_bottom/core/custom_scaffold.dart';

class Screen4 extends StatelessWidget {
  static const String routeName = '/screen4';
  const Screen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Screen4',
      body: Center(
        child: Text('Screen4'),
      ),
    );
  }
}
