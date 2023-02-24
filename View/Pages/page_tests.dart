import 'package:flutter/material.dart';
import 'package:synag/View/Scaffold/my_scaffold_all.dart';
import 'package:synag/View/Screens/test_screen.dart';


class TestsPage extends StatelessWidget {
  const TestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
      bottomDrawer: true,
      appBarLeading:const BackButton(),
      body: TestScreen());
  }
}
