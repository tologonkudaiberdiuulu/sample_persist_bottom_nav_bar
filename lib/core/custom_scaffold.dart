import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:test_animated_nested_bottom/core/services.dart';
import 'package:test_animated_nested_bottom/menu/menu_screen.dart';

import '../alarm/alarm.dart';
import '../home/home.dart';
import 'navigator.dart';

class CustomScaffold extends StatefulWidget {
  final String title;
  final int? selectedTab;
  final Widget body;

  const CustomScaffold({
    Key? key,
    this.title = '',
    this.selectedTab,
    required this.body,
  }) : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;
  int _bottomNavIndex = -1;

  final List<Map<String, dynamic>> iconList = [
    {
      'icon': Icons.home_outlined,
      'title': 'Home',
    },
    {
      'icon': Icons.search,
      'title': 'Search',
    },
    {
      'icon': Icons.access_alarm_outlined,
      'title': 'Alarm',
    },
    {
      'icon': Icons.logout,
      'title': 'Log Out',
    },
  ];

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        1,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      const Duration(milliseconds: 1),
      () => _animationController.forward(),
    );
    if (widget.selectedTab == null) {
      _bottomNavIndex = -1;
    } else {
      _bottomNavIndex = widget.selectedTab!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool keyboardIsOpened = mediaQuery.viewInsets.bottom != 0.0;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        extendBody: true,
        body: widget.body,
        appBar: AppBar(title: Text(widget.title)),
        floatingActionButton: keyboardIsOpened
            ? null
            : FloatingActionButton(
                heroTag: UniqueKey(),
                onPressed: () {
                  app<SampleNavigator>().pushNamed(
                    MenuScreen.routeName,
                    type: RouteType.fade,
                  );
                  if (_bottomNavIndex != -1) {
                    setState(() {
                      _bottomNavIndex = -1;
                    });
                  }
                },
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  padding: const EdgeInsets.all(1.5),
                  alignment: Alignment.center,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange,
                          Colors.deepOrange,
                        ],
                        begin: Alignment(-1, 0),
                        end: Alignment(2, 0),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: const Icon(Icons.menu),
                  ),
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? Colors.orange : Colors.black;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconList[index]['icon'],
                  color: color,
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    iconList[index]['title'],
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: _bottomNavIndex == -1 ? Colors.black : color,
                    ),
                  ),
                )
              ],
            );
          },
          backgroundColor: Colors.black.withOpacity(0.3),
          activeIndex: _bottomNavIndex,
          splashColor: Colors.orange,
          notchAndCornersAnimation: animation,
          splashSpeedInMilliseconds: 300,
          notchSmoothness: NotchSmoothness.smoothEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 15,
          rightCornerRadius: 15,
          onTap: (index) {
            if (index != 1 && index != 3) {
              setState(() => _bottomNavIndex = index);
            }

            if (index == 0) {
              app<SampleNavigator>().pushNamedAndRemoveUntil(
                Home.routeName,
                type: RouteType.fade,
              );
            } else if (index == 1) {
              showGeneralDialog(
                context: context,
                pageBuilder: (ctx, animation1, animation2) {
                  return Material(
                    type: MaterialType.transparency,
                    child: Center(
                      child: Container(
                        width: 371,
                        height: 267,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 37,
                          vertical: 40,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // blurRadius:
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'This is search dialog',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 44),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (index == 2) {
              app<SampleNavigator>().pushNamed(
                Alarm.routeName,
                type: RouteType.fade,
              );
            } else if (index == 3) {
              showGeneralDialog(
                context: context,
                pageBuilder: (ctx, animation1, animation2) {
                  return Material(
                    type: MaterialType.transparency,
                    child: Center(
                      child: Container(
                        width: 371,
                        height: 267,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 37,
                          vertical: 40,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.grey,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              // blurRadius:
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Are you sure\nyou want to log out?',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 44),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('No'),
                                ),
                                const SizedBox(width: 24),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Yes'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
