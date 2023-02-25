import 'package:flutter/material.dart';
import 'package:synag/View/Screens/question_screen.dart';
import 'package:synag/ViewModel/Providers/provider_test.dart';
import '../../ViewModel/Providers/Scaffold/provider_navigation_bar.dart';

// ignore: must_be_immutable
class GetTestScreens extends StatelessWidget {
  List tests;
  GetTestScreens({required this.tests, super.key});

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return buildScreens();
  }

  List<Widget> screens = [];

  Widget buildScreens() {
    screens = List.generate(
        tests.length,
        (index) => QuestionScreen(
              test: tests[index],
            ));

    screens = screens..shuffle();

    return Stack(
      children: List.generate(
          ProcessTest(context).countSelectTest,
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
