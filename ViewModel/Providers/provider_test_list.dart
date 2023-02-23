import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synag/Model/test_element_model.dart';

class ProviderTestList extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<ElemTest> _tests = [];
  List get tests => _tests;

  void addTest(ElemTest obj) {
    _tests.add(obj);
    notifyListeners();
  }

  void deleteTest(ElemTest obj) {
    _tests.remove(obj);
    notifyListeners();
  }
}

class ProcessTest {
  final BuildContext context;
  ProcessTest(this.context);

  dynamic _changeProvider(BuildContext context) {
    return Provider.of<ProviderTestList>(context, listen: false);
  }

  void addTest(ElemTest obj) => _changeProvider(context).addTest(obj);
  void deleteTest(ElemTest obj) => _changeProvider(context).deleteTest(obj);
}

class DistributorTest {
  final BuildContext context;
  DistributorTest(this.context);

  dynamic _getProvider(BuildContext context) {
    return Provider.of<ProviderTestList>(context);
  }

  List<ElemTest> get tests => _getProvider(context).tests;
  int get length => _getProvider(context).tests.length;
}
