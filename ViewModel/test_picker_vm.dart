import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:synag/Model/test_element_model.dart';

import 'Providers/provider_test.dart';

class TxtPicker {
  static Future<List<List<String>>> pick(context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["txt"],
    );

    if (result != null) {
      final PlatformFile txtFile = result.files.first;
      debugPrint(
          "==================================================================================================");
      final List<List<String>> objs = await TestConverter().txtToTest(txtFile);
      if (objs.isEmpty) {
        debugPrint("txt can't convert test!!!");
      } else {
        debugPrint("Test sucsessed!");
        ProcessTest(context).changeTest(objs);
      }
      debugPrint(
          "==================================================================================================");
    } else {
      debugPrint("Txt file not selected!!!");
    }
    return [];
  }
}

class TestConverter {
  List<String> elemToList(ElemTest obj) {
    return [
      obj.ask,
      obj.a,
      obj.b,
      obj.c,
      obj.d,
      obj.answer.toString(),
    ];
  }

  List<List<String>> toList(List<ElemTest> list) {
    List<List<String>> result = [];
    for (int i = 0; i < list.length; i++) {
      result.add(elemToList(list[i]));
    }
    return result;
  }

  ElemTest listToElem(List<String> list) {
    return ElemTest(
        ask: list[0],
        a: list[1],
        b: list[2],
        c: list[3],
        d: list[4],
        count: 4,
        answer: int.parse(list[5]),
        sucsess: true);
  }

  List<ElemTest> toElem(List list) {
    List<ElemTest> result = [];
    for (int i = 0; i < list.length; i++) {
      result.add(listToElem(list[i]));
    }
    return result;
  }

  List<String>? strToList(String text) {
    LineSplitter ls = const LineSplitter();
    List<String> result = ls.convert(text);
    return result;
  }

  String asking(String str) {
    final int startIndex = str.indexOf(".");
    if (startIndex <= 3) {
      return str.substring(startIndex + 1);
    } else {
      return str;
    }
  }

  String chicks(String str) {
    final int startIndex = str.indexOf(")");
    if (startIndex == 1) {
      return str.substring(2);
    }
    return "";
  }

  List<List<String>> listToTest(List<String> list) {
    List<String> test = [];
    List<List<String>> result = [];
    for (int i = 0; i < list.length; i++) {
      final str = list[i];
      if (str.length > 6 && str.substring(0, 6) == "Jogap:") {
        debugPrint("sadasjdkasl******************************************");
        result.add(test + [str[6]]);
        test = [];
      } else if (test.isEmpty && str != "") {
        test.add(asking(str));
      } else if (str != "") {
        test.add(chicks(str));
      }
    }
    return result;
  }

  Future<List<List<String>>> txtToTest(PlatformFile txtFile) async {
    final file = File(txtFile.path!);
    final txt = await file.readAsString();
    final List<String>? list = strToList(txt);
    if (list != null) {
      final List<List<String>> textList = listToTest(list);
      return textList;
    }
    return [];
  }
}
