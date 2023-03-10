// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';

class ThemeColor {
  Color appBar = Colors.purple[100]!;
  Color appBarIcon = Colors.black;
  Color text = Colors.black;
  Color canvas = Colors.white;
    Color testCard = Colors.grey[300]!;
}

class ThemeDarkColor extends ThemeColor {
  @override
  Color appBar = const Color.fromARGB(255, 66, 66, 66);
    @override
  Color appBarIcon = Colors.white;
  @override
  Color text = Colors.white;
  @override
  Color canvas = const Color.fromARGB(255, 97, 97, 97);
   @override
  Color testCard =  Colors.grey[900]!;
}
