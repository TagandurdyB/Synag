import 'package:flutter/material.dart';
import 'package:synag/Model/test_element_model.dart';
import '/View/Scaffold/my_scaffold_all.dart';
import '/View/Widgets/ReadyInput/ready_input_base.dart';
import '/ViewModel/Providers/provider_test_list.dart';
import '/ViewModel/Providers/provider_theme.dart';
import '/ViewModel/names_vm.dart';

import '../Widgets/ReadyInput/ready_input.dart';
import '../Widgets/txt_picker_widget.dart';

// ignore: must_be_immutable
class AddTestPage extends StatelessWidget {
  AddTestPage({super.key});

  late BuildContext contextM;

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
              const ReadyInput(
                tag: RITags.rITestName,
                shape: true,
                borderRad: 20,
                label: "Synagyň ady:",
              ),
              buildFilePicker(),
              buildBtns()
            ],
          ),
        ));
  }

Widget buildFilePicker()=> TxtPickerWidget();

  Widget buildBtns() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      buildCencel(),
      MaterialButton(
        color: Colors.blue,
        onPressed: () {
          if (!RIBase.isEmpety(RITags.rITestName)) {
            final obj=ElemTest(name: RIBase.getText(RITags.rITestName));
            ProcessTest(contextM).addTest(obj);
             Navigator.pop(contextM);
          } else{
              
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
