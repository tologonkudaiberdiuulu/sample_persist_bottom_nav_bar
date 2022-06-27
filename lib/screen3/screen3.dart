import 'package:flutter/material.dart';
import 'package:test_animated_nested_bottom/core/custom_scaffold.dart';

class Screen3 extends StatelessWidget {
  static const String routeName = '/screen3';
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Screen3',
      body: Center(
        child: Text('Screen3'),
      ),
    );
  }
}
