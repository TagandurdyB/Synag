import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:synag/Model/test_element_model.dart';
import 'package:synag/View/Widgets/my_container.dart';
import 'package:synag/View/Widgets/pop_up_widget.dart';
import 'package:synag/ViewModel/Providers/provider_test.dart';
import 'package:synag/ViewModel/Providers/provider_theme.dart';
import 'package:synag/ViewModel/names_vm.dart';

import '../../ViewModel/routes_vm.dart';
import '../../ViewModel/size_vm.dart';
import '../Widgets/counter_widget.dart';

// ignore: must_be_immutable
class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            leading: DistributorTheme(context).texts.settingTitle,
          ),
          buildTitles(),
          Expanded(
              child: ListView(
            physics: const BouncingScrollPhysics(),
            children: List.generate(DistributorTest(context).length, (index) {
              final String key = DistributorTest(context).keys[index];
              return buildTestCard(DistributorTest(context).tests(key), key);
            }),
          ))
        ],
      ),
    );
  }

  Widget buildTitles() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Ady"),
            DistributorTheme(context).texts.testCount,
            Text("Saýla"),
          ],
        ),
      );

  Widget buildAddBtn() => ElevatedButton(
        onPressed: () {
          ProcessTest(context).ereaseTest();
          Navigator.pushNamed(context, Rout.add);
        },
        child: DistributorTheme(context).texts.add,
      );

  Widget buildTestCard(List<ElemTest> test, String key) => MyContainer(
        color: Colors.transparent,
        shape: MySize.width * 0.02,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(child: Text(key)),
          Expanded(child: Center(child: Text("${test.length}"))),
          Expanded(
            child: MyContainer(
                alignment: Alignment.centerRight,
                color: Colors.transparent,
                borderColor: Colors.transparent,
                onTap: () => editTest(key, test.length),
                child: DistributorTheme(context).icons.edit),
          ),
        ]),
      );

  void editTest(String key, int count) {
    final myCout = Hive.box(Names.count);
    ProcessTest(context).editTestCout(key);
    PopUpWidget(
        title: "Aktiw sorag sany",
        content: CounterWidget(
            name: key, maxValue: count, startValue: myCout.get(key)),
        actionsTeam: [ActionsTeam(text: "Tamam")]).popUpCupertino(context);
  }
}
