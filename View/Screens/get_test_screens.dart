import 'package:flutter/material.dart';
import 'package:synag/Model/test_element_model.dart';
import 'package:synag/View/Screens/question_screen.dart';
import '../../ViewModel/Providers/Scaffold/provider_navigation_bar.dart';
import 'test_screen.dart';
import 'start_screen.dart';

// ignore: must_be_immutable
class GetTestScreens extends StatelessWidget {
  List tests;
  GetTestScreens({required this.tests, super.key});

  @override
  Widget build(BuildContext context) {
    return buildScreens();
  }

  /* List<Widget> screens = [
    StartScreen(),
    TestScreen(),
  ];*/

  List<Widget> screens = [];

  Widget buildScreens() {
    screens = List.generate(
        tests.length,
        (index) => QuestionScreen(
              test: tests[index],
              count: tests.length,
            ));
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
