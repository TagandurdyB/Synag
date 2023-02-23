import 'package:flutter/material.dart';
import 'package:synag/Model/test_element_model.dart';
import 'package:synag/View/Widgets/my_container.dart';
import 'package:synag/ViewModel/Providers/provider_theme.dart';

import '../../ViewModel/size_vm.dart';
import '../../ViewModel/test_picker_vm.dart';

// ignore: must_be_immutable
class TxtPickerWidget extends StatefulWidget {


  TxtPickerWidget({super.key});

  @override
  State<TxtPickerWidget> createState() => _TxtPickerWidgetState();
}

class _TxtPickerWidgetState extends State<TxtPickerWidget> {
ElemTest? obj;

  final width = MySize.width;

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return MyContainer(
      onTap: _pickTxt,
      width: width * 0.9,
      height: width * 0.5,
      margin: const EdgeInsets.all(8),
      color: Colors.transparent,
      shape: width * 0.05,
      borderWidth: 4,
      borderColor: obj==null?Colors.grey:Colors.green,
      child: obj==null?buildIcon():buildSucsess(),
    );
  }

void _pickTxt()async{
 obj=await TxtPicker().pick(context);
 setState(() {
   
 });
}

  Widget buildIcon() => Column(children: [
        DistributorTheme(context).icons.txtPicker,
        DistributorTheme(context).texts.testPicker,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: DistributorTheme(context).texts.pickerDesc,
        ),
      ]);

   Widget buildSucsess() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
        DistributorTheme(context).icons.txtSucsess,
        DistributorTheme(context).texts.testSucsess,
      ]);     
}
