import 'package:synag/View/Pages/page_add_test.dart';
import 'package:synag/View/Pages/page_test_setting.dart';
import 'package:synag/View/Pages/page_tests.dart';

import '/View/Pages/page_home.dart';
import 'package:flutter/material.dart';

import '../View/Pages/page_logo.dart';

class Rout {
  // Home never change!!!
  static const String home = "/HomePage";
  static const String logo = "/LogoPage";
  static const String add = "/AddTestPage";
  static const String tests = "/TestsPage";
  static const String getTest = "/GetTestPage";
  static const String setting = "/TestSettingPage";

  static Map<String, Widget Function(dynamic)> pages = {
    logo: (context) => const LogoPage(),
    home: (context) => const HomePage(),
    add: (context) => AddTestPage(),
    tests: (context) => const TestsPage(),
   // getTest: (context) =>  GetTestPage(),
    setting: (context) => const TestSettingPage(),
  };
}
