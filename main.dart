import 'package:synag/ViewModel/Providers/provider_orientation.dart';
import 'package:synag/ViewModel/names_vm.dart';

import '/ViewModel/Providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'ViewModel/routes_vm.dart';
import 'ViewModel/theme_vm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.openBox(Names.base);
  Hive.openBox(Names.count);
  runApp(MultiProvider(providers: MyProvoders.list, child: const MyApp()));
  MyOrientation.systemUiOverlayStyle();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyTheme(context).theme(),
      initialRoute: Rout.logo,
      routes: Rout.pages,
    );
  }
}
