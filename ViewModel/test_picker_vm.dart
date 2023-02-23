import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:synag/Model/test_element_model.dart';

import 'Providers/provider_test_list.dart';

class TxtPicker {
  Future<ElemTest?> pick(context) async {

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["txt"],
    );

    if (result != null) {
      final PlatformFile txt = result.files.first;
      final String? path = txt.path;
      if (path != null) {
        final file=File(path);
        debugPrint("Result name:= ${txt.name}");
debugPrint("==================================================================================================");
debugPrint("${await file.readAsString()}");
debugPrint("==================================================================================================");

        final ElemTest ask = ElemTest(name: txt.name,sucsess: true);
        //ProcessTest(context).addTest(ask);
        return ask;
      }
    } else {
      debugPrint("Error!!!");
    }
    return null;
  }
}
