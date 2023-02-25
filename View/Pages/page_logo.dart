import 'package:flutter/material.dart';
import '/View/Widgets/my_container.dart';
import '../../ViewModel/routes_vm.dart';
import '../../ViewModel/size_vm.dart';
import '../../ViewModel/time_vm.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Time.times.logo)
        .then((value) => Navigator.pushReplacementNamed(context, Rout.home));
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    MySize().changeSize(size.width,size.height);
    return Scaffold(
      body: Center(child: buildLogo()),
    );
  }

  Widget buildLogo() => MyContainer(
   shape: MySize.width*0.05,
   colors: const [Colors.red,Colors.blue,],
   borderColor: Colors.white,
   borderWidth: MySize.width*0.015,
    padding: EdgeInsets.all(MySize.width*0.05),
    child: Text("SYNAG",style:TextStyle(fontSize: MySize.width*0.1)),
  );
}
