import 'package:flutter/material.dart';
import 'package:synag/View/Scaffold/my_scaffold_all.dart';
import '../Screens/setting_screen.dart';


class TestSettingPage extends StatelessWidget {
  const TestSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
      bottomDrawer: true,
      appBarLeading:const BackButton(),
      body: SettingScreen());
  }
}
