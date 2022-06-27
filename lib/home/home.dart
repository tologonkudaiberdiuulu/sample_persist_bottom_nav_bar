import 'package:flutter/material.dart';
import 'package:test_animated_nested_bottom/core/custom_scaffold.dart';

class Home extends StatelessWidget {
  static const String routeName = '/home';
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      body: Center(child: Text('Home')),
      title: 'Home',
      selectedTab: 0,
    );
  }
}
