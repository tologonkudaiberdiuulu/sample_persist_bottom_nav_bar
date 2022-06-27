import 'package:flutter/material.dart';
import 'package:test_animated_nested_bottom/core/custom_scaffold.dart';
import 'package:test_animated_nested_bottom/core/navigator.dart';
import 'package:test_animated_nested_bottom/core/services.dart';
import 'package:test_animated_nested_bottom/screen1/screen1.dart';

class MenuScreen extends StatelessWidget {
  static const String routeName = '/menu';
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Menu',
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      app<SampleNavigator>().pushNamed(Screen1.routeName);
                    },
                    child: const Card(
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Text(
                          'Screen1',
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Card(
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Text(
                          'Screen2',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Card(
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Text(
                          'Screen3',
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Card(
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Text(
                          'Screen4',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
