import 'package:flutter/material.dart';
import 'package:test_animated_nested_bottom/core/custom_scaffold.dart';

class Alarm extends StatelessWidget {
  static const String routeName = '/alarm';
  const Alarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Alarm',
      body: Center(child: Text('Alarm')),
    );
  }
}
