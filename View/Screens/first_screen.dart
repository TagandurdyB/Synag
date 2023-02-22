import 'package:flutter/material.dart';
import 'package:synag/ViewModel/Providers/provider_test_list.dart';
import 'package:synag/ViewModel/Providers/provider_theme.dart';

import '../../ViewModel/routes_vm.dart';

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
           ListTile(leading: Text("Ady"),trailing: Text("Sorag sany"),),   
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

  Widget buildAddBtn() => IconButton(
        onPressed: () => Navigator.pushNamed(contextM, Rout.add),
        icon: Icon(
          Icons.add,
          color: DistributorTheme(contextM).colors.text,
        ),
      );

  Widget buildTestCard(String test) {
    return Card(
      color: DistributorTheme(contextM).colors.testCard,
        child: ListTile(
      onTap: () {},
      leading: Text(test),
      trailing: Text("0"),
    ));
  }
}
