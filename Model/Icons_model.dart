// ignore_for_file: overridden_fields, file_names
import 'package:flutter/material.dart';
import 'package:synag/ViewModel/size_vm.dart';

class ThemeIcon {
  Icon changeMod = const Icon(Icons.mode_night_sharp, color: Colors.black);
  Icon txtPicker =  Icon(Icons.note_add_outlined, color: Colors.grey,size: MySize.width*0.3);
    Icon txtSucsess =  Icon(Icons.text_snippet_outlined, color: Colors.green[300],size: MySize.width*0.3);
  Icon delete =  Icon(Icons.delete_forever, color: Colors.red,size: MySize.width*0.07);
}

class ThemeDarkIcon extends ThemeIcon {
  @override
  Icon changeMod = const Icon(Icons.sunny, color: Colors.white);
}
