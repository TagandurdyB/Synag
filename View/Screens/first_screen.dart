import 'package:flutter/material.dart';
import 'package:synag/Model/test_element_model.dart';
import 'package:synag/View/Widgets/my_container.dart';
import 'package:synag/ViewModel/Providers/provider_test_list.dart';
import 'package:synag/ViewModel/Providers/provider_theme.dart';

import '../../ViewModel/routes_vm.dart';
import '../../ViewModel/size_vm.dart';

// ignore: must_be_immutable
class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  late BuildContext contextM;

  @override
  Widget build(BuildContext context) {
    contextM = context;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
              leading: DistributorTheme(context).texts.firstTitle,
              trailing: buildAddBtn()),
          buildTitles(),
          Expanded(
              child: ListView(
            physics: const BouncingScrollPhysics(),
            children: List.generate(
                DistributorTest(contextM).length,
                (index) =>
                    buildTestCard(DistributorTest(contextM).tests[index])),
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
            DistributorTheme(contextM).texts.testCount,
            Text("Aýyr"),
          ],
        ),
      );

  Widget buildAddBtn() => ElevatedButton(
        onPressed: () => Navigator.pushNamed(contextM, Rout.add),
        child: DistributorTheme(contextM).texts.add,
      );

  Widget buildTestCard(ElemTest test) => MyContainer(
        color: Colors.transparent,
        shape: MySize.width * 0.02,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding:const  EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(child: Text(test.name)),
          Expanded(child: Center(child: Text("0"))),
          Expanded(
            child: MyContainer(
                alignment: Alignment.centerRight,
                color: Colors.transparent,
                borderColor: Colors.transparent,
                onTap: () => ProcessTest(contextM).deleteTest(test),
                child: DistributorTheme(contextM).icons.delete),
          ),
        ]),
      );
}
