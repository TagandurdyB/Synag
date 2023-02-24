import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:synag/Model/test_element_model.dart';
import 'package:synag/View/Widgets/pop_up_widget.dart';
import 'package:synag/ViewModel/test_picker_vm.dart';

import '../names_vm.dart';

class ProviderTest extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<ElemTest> _tests = [];
  List get tests => _tests;

  PlatformFile? _txt;
  PlatformFile? get txt => _txt;

  void changeTXT(PlatformFile file) {
    _txt = file;
    notifyListeners();
  }

  void addTest(ElemTest obj) {
    _tests.add(obj);
    notifyListeners();
  }

  List<List<String>> _txtList = [];
  List<List<String>> get txtList => _txtList;

  void addLastTxtTest(List<List<String>> test) {
    _txtList = test;
    notifyListeners();
  }

  void ereaseLastTxtTest() {
    _txtList = [];
    notifyListeners();
  }

  final myBase = Hive.box(Names.base);
  final myCout = Hive.box(Names.count);

  void changeCount(String name, int value) {
    myCout.put(name,value);
    notifyListeners();
  }

  int countValue(String key) {
    final getHive = myCout.get(key);
    if (getHive==null) {
      return 0;
    }
    return getHive;
  }

  void addHive(String name, List value) {
    myBase.put(name, value);
    changeCount(name,value.length);
    notifyListeners();
  }

  List<ElemTest> testValues(String key) {
    final getHive = myBase.get(key);
    if (getHive.isEmpty) {
      return [];
    }
    return TestConverter().toElem(getHive);
  }

  List testkeys() {
    final getHive = myBase.keys.toList();
    if (getHive.isEmpty) {
      return [];
    }
    return getHive;
  }

  void deleteTest(String key) {
    myBase.delete(key);
    notifyListeners();
  }

  void editTestCount(String key) {
    //myBase.delete(key);
    notifyListeners();
  }

}

class ProcessTest {
  final BuildContext context;
  ProcessTest(this.context);

  dynamic _changeProvider(BuildContext context) {
    return Provider.of<ProviderTest>(context, listen: false);
  }

  void addTest(ElemTest obj) => _changeProvider(context).addTest(obj);
  void changeTXT(PlatformFile txt) => _changeProvider(context).changeTXT(txt);
  void deleteTest(String key) => _changeProvider(context).deleteTest(key);
  void editTestCout(String key) => _changeProvider(context).editTestCount(key);

  void changeTest(List<List<String>> txt) =>
      _changeProvider(context).addLastTxtTest(txt);

  void ereaseTest() => _changeProvider(context).ereaseLastTxtTest();
  List<List<String>> get testList => _changeProvider(context).txtList;

  void addHive(String name, List value) =>
      _changeProvider(context).addHive(name, value);

    void changeCount(String name, int value) =>
      _changeProvider(context).changeCount(name, value);    
}

class DistributorTest {
  final BuildContext context;
  DistributorTest(this.context);

  dynamic _getProvider(BuildContext context) {
    return Provider.of<ProviderTest>(context);
  }

  PlatformFile? get txt => _getProvider(context).txt;
  //List<ElemTest> get tests => _getProvider(context).tests;

  List<ElemTest> tests(String key) => _getProvider(context).testValues(key);

    int countVal(String key) => _getProvider(context).countValue(key);


  List get keys => _getProvider(context).testkeys();

  int get length => _getProvider(context).testkeys().length as int;

  List<List<String>> get selectTest => _getProvider(context).txtList;
}
