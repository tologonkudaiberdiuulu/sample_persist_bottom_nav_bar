import 'package:flutter/material.dart';
import 'package:test_animated_nested_bottom/alarm/alarm.dart';
import 'package:test_animated_nested_bottom/home/home.dart';
import 'package:test_animated_nested_bottom/menu/menu_screen.dart';
import 'package:test_animated_nested_bottom/no_screen/no_screen.dart';
import 'package:test_animated_nested_bottom/screen2/screen2.dart';
import 'package:test_animated_nested_bottom/screen3/screen3.dart';
import 'package:test_animated_nested_bottom/screen4/screen4.dart';

import '../screen1/screen1.dart';
import 'fade_route.dart';

enum RouteType {
  defaultRoute,
  fade,
}

final manasRouteObserver = RouteObserver<ModalRoute<dynamic>>();

class SampleNavigator {
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  NavigatorState get state => key.currentState!;

  void pop<T extends Object>([T? result]) {
    // print('popped');
    state.pop<T>(result);
  }

  Future<bool> maybePop<T extends Object>([T? result]) =>
      state.maybePop(result);

  Future<T?> push<T>(Route<T> routeName) => state.push<T>(routeName);

  void pushReplacementNamed(
    String routeName, {
    RouteType type = RouteType.defaultRoute,
    Map<String, dynamic>? arguments,
  }) {
    state.pushReplacementNamed<void, void>(
      routeName,
      arguments: <String, dynamic>{
        'routeType': type,
        ...?arguments,
      },
    );
  }

  void pushNamedAndRemoveUntil(
    String routeName, {
    RouteType type = RouteType.defaultRoute,
    Map<String, dynamic>? arguments,
  }) {
    state.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: <String, dynamic>{
        'routeType': type,
        ...?arguments,
      },
    );
  }

  Future<void> pushNamed(
    String routeName, {
    RouteType type = RouteType.fade,
    Map<String, dynamic>? arguments,
  }) {
    return state.pushNamed<void>(
      routeName,
      arguments: <String, dynamic>{
        'routeType': type,
        ...?arguments,
      },
    );
  }
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  final routeName = settings.name;
  final arguments =
      settings.arguments as Map<String, dynamic>? ?? <String, dynamic>{};
  final routeType =
      arguments['routeType'] as RouteType? ?? RouteType.defaultRoute;

  print('Navigating to $routeName');

  Widget screen;

  switch (routeName) {
    case Screen1.routeName:
      screen = const Screen1();
      break;
    case Screen2.routeName:
      screen = const Screen2();
      break;
    case Screen3.routeName:
      screen = const Screen3();
      break;
    case Screen4.routeName:
      screen = const Screen4();
      break;
    case MenuScreen.routeName:
      screen = const MenuScreen();
      break;
    case Home.routeName:
      screen = const Home();
      break;
    case Alarm.routeName:
      screen = const Alarm();
      break;
    default:
      screen = const NoScreen();
  }

  switch (routeType) {
    case RouteType.fade:
      return FadeRoute<void>(
        duration: const Duration(seconds: 1),
        builder: (_) => screen,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );

    case RouteType.defaultRoute:
      return MaterialPageRoute(
        builder: (_) {
          return screen;
        },
      );
  }
}
