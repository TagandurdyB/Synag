import 'package:flutter/material.dart';
import '../../ViewModel/Providers/Scaffold/provider_navigation_bar.dart';
import 'test_screen.dart';
import 'start_screen.dart';

// ignore: must_be_immutable
class HomeScreens extends StatelessWidget {
  HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return buildScreens();
  }

  List<Widget> screens =  [
     StartScreen(),
    TestScreen(),
  ];

  Widget buildScreens() {
    return Stack(
      children: List.generate(
          screens.length,
          (index) => Builder(
                builder: (context) => Offstage(
                  offstage:
                      index != DistributorNavigationBar(context).screenIndex,
                  child: Scaffold(
                    body: screens[index],
                  ),
                ),
              )),
    );
  }
}
