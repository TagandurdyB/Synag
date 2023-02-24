// ignore_for_file: overridden_fields

import '/ViewModel/size_vm.dart';
import 'package:flutter/material.dart';

class ThemeStyle {
  TextStyle appBar =
      TextStyle(color: Colors.black, fontSize: MySize.width * 0.05);
  TextStyle input =
      TextStyle(color: Colors.black, fontSize: MySize.width * 0.035);
  TextStyle btns =
      TextStyle(color: Colors.black, fontSize: MySize.width * 0.04);
  TextStyle picker =
      TextStyle(color: Colors.grey, fontSize: MySize.width * 0.05);
  TextStyle pickerDesc =
      TextStyle(color: Colors.grey, fontSize: MySize.width * 0.03);
  TextStyle question =
      TextStyle(color: Colors.black, fontSize: MySize.width * 0.07);
  TextStyle check =
      TextStyle(color: Colors.black, fontSize: MySize.width * 0.06);
}

class ThemeDarkStyle extends ThemeStyle {
  @override
  TextStyle appBar = TextStyle(fontSize: MySize.width * 0.05);
  @override
  TextStyle input =
      TextStyle(color: Colors.white, fontSize: MySize.width * 0.035);
  @override
  TextStyle btns =
      TextStyle(color: Colors.white, fontSize: MySize.width * 0.04);
  @override
  TextStyle picker =
      TextStyle(color: Colors.grey, fontSize: MySize.width * 0.05);
  @override
  TextStyle pickerDesc =
      TextStyle(color: Colors.grey, fontSize: MySize.width * 0.03);
  @override
  TextStyle question =
      TextStyle(color: Colors.white, fontSize: MySize.width * 0.07);
  @override
  TextStyle check =
      TextStyle(color: Colors.white, fontSize: MySize.width * 0.06);
}
