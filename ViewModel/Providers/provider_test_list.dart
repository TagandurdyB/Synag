import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderTestList extends ChangeNotifier {
  // ignore: prefer_final_fields
  List _tests = [];
  List get tests => _tests;

  void addTest(String name) {
    _tests.add(name);
    notifyListeners();
  }
}

class ProcessTest {
  final BuildContext context;
  ProcessTest(this.context);

  dynamic _changeProvider(BuildContext context) {
    return Provider.of<ProviderTestList>(context, listen: false);
  }

  void addTest(String name) => _changeProvider(context).addTest(name);
}

class DistributorTest {
  final BuildContext context;
  DistributorTest(this.context);

  dynamic _getProvider(BuildContext context) {
    return Provider.of<ProviderTestList>(context);
  }

  List get tests => _getProvider(context).tests;
  int get length => _getProvider(context).tests.length;
}
