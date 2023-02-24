import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../ViewModel/routes_vm.dart';
import '/View/Scaffold/my_scaffold_all.dart';
import '/View/Widgets/ReadyInput/ready_input_base.dart';
import '../../ViewModel/Providers/provider_test.dart';
import '/ViewModel/Providers/provider_theme.dart';
import '/ViewModel/names_vm.dart';

import '../Widgets/ReadyInput/ready_input.dart';
import '../Widgets/txt_picker_widget.dart';

// ignore: must_be_immutable
class AddTestPage extends StatelessWidget {
  AddTestPage({super.key});

  late BuildContext contextM;
  FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    contextM = context;
    return ScaffoldAll(
        appBarLeading: const BackButton(),
        bottomDrawer: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ListTile(leading: DistributorTheme(context).texts.addTitle),
              ReadyInput(
                tag: RITags.rITestName,
                shape: true,
                borderRad: 20,
                focus: focus,
                autoFocus: true,
                label: "Synagyň ady:",
              ),
              buildFilePicker(),
              buildBtns()
            ],
          ),
        ));
  }

  Widget buildFilePicker() => TxtPickerWidget();

  Widget buildBtns() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      buildCencel(),
      MaterialButton(
        color: Colors.blue,
        onPressed: () {
          if (!RIBase.isEmpety(RITags.rITestName)) {
            final String name = RIBase.getText(RITags.rITestName);
            final List<List<String>> listTest = ProcessTest(contextM).testList;
            // myBase.put(name, listTest);
            ProcessTest(contextM).addHive(name, listTest);
            Navigator.pop(contextM);
          } else {
            focus.requestFocus();
          }
        },
        child: DistributorTheme(contextM).texts.add,
      )
    ]);
  }

  MaterialButton buildCencel() {
    return MaterialButton(
      color: Colors.red,
      onPressed: () => Navigator.pop(contextM),
      child: DistributorTheme(contextM).texts.cancel,
    );
  }
}
