import 'package:flutter/material.dart';

import '../Scaffold/my_scaffold_all.dart';
import '../Screens/get_test_screens.dart';

class GetTestPage extends StatelessWidget {
  final List tests;
  const GetTestPage({
    super.key,
    required this.tests,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
        appBarLeading: const BackButton(), body: GetTestScreens(tests: tests));
  }
}
