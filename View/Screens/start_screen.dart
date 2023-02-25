import 'package:flutter/material.dart';
import 'package:synag/View/Pages/page_get_test.dart';
import 'package:synag/View/Scaffold/my_snack_bar.dart';

import '../../Model/test_element_model.dart';
import '../../ViewModel/Providers/Scaffold/provider_navigation_bar.dart';
import '../../ViewModel/Providers/provider_test.dart';
import '../../ViewModel/Providers/provider_theme.dart';
import '../../ViewModel/size_vm.dart';
import '../Widgets/my_container.dart';

// ignore: must_be_immutable
class StartScreen extends StatelessWidget {
  StartScreen({super.key});

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            leading: DistributorTheme(context).texts.firstTitle,
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
            const Text("Ady"),
            DistributorTheme(context).texts.testCount,
          ],
        ),
      );

  Widget buildTestCard(List<ElemTest> test, String key) => MyContainer(
        onTap: () {
          //Navigator.pushNamed(context, Rout.getTest);
          if(ProcessTest(context).countVal(key)!=0){
            ProcessTest(context).changeKey(key);
            ProcessTest(context).trueErease;
            ProcessNavigationBar(context).changeIndex(0);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>GetTestPage(tests: test)));
          }else{
            MySnack(
              message: "Sorag ýok!",textBgColor: Colors.red,
              textColor: Colors.white,sec: 1
            ).pushSnack(context);
          }
        },
        color: Colors.transparent,
        shape: MySize.width * 0.02,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(child: Text(key)),
          Center(child: Text("${DistributorTest(context).countVal(key)}")),
        ]),
      );
}
