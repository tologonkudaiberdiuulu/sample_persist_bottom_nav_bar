import 'package:flutter/material.dart';
import 'package:test_animated_nested_bottom/core/custom_scaffold.dart';

class Screen1 extends StatelessWidget {
  static const String routeName = '/screen1';
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Screen1',
      body: Center(
        child: Text('Screen1'),
      ),
    );
  }
}
