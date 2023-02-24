import 'package:synag/ViewModel/Providers/Scaffold/provider_navigation_bar.dart';

import '/ViewModel/Providers/provider_theme.dart';
import 'package:flutter/material.dart';

import '../../ViewModel/routes_vm.dart';
import '../../ViewModel/size_vm.dart';
import '../Widgets/draw_bar_btn.dart';
import '../Widgets/my_container.dart';

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget {
  final Widget? title;
  MyDrawer({
    super.key,
    this.title,
  });

  late BuildContext contextM;

  @override
  Widget build(BuildContext context) {
    contextM = context;
    return Drawer(
      child: Column(children: [
        buildTopLine(context),
        title ?? const SizedBox(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  DrawBarBtn(
                    onTap: () {
                      ProcessNavigationBar(context).changeIndex(0);
                      Navigator.pushNamedAndRemoveUntil(
                          context, Rout.home, (route) => false);
                    },
                    //  titleLeft: SWi * 0.15,
                    leading: draverIcon(Icons.home),
                    title: const Text("Baş sahypa"),
                    trailing: IconButton(
                        onPressed: () {
                          ProcessTheme(context).tongleTheme;
                        },
                        icon: DistributorTheme(context).icons.changeMod),
                  ),
                  DrawBarBtn(
                    onTap: () {
                      if (ModalRoute.of(context)?.settings.name != Rout.tests) {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, Rout.tests);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    //  titleLeft: SWi * 0.15,
                    leading: draverIcon(Icons.quiz_outlined),
                    title: const Text("Synaglar"),
                    // trailing: ,
                  ),
                   DrawBarBtn(
                    onTap: () {
                      if (ModalRoute.of(context)?.settings.name != Rout.setting) {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, Rout.setting);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    //  titleLeft: SWi * 0.15,
                    leading: draverIcon(Icons.settings),
                    title: const Text("Sazlamalar"),
                    // trailing: ,
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  Container buildTopLine(BuildContext context) {
    return Container(
      color: const Color(0xff7262DF),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
    );
  }

  Widget draverIcon(IconData icon) {
    final double sizeWidth = MySize.width;
    return MyContainer(
        shape: sizeWidth * 0.02,
        borderColor: Colors.blue[500]!,
        borderWidth: sizeWidth * 0.003,
        width: sizeWidth * 0.11,
        height: sizeWidth * 0.11,
        color: DistributorTheme(contextM).colors.canvas,
        child: Icon(
          icon,
          color: Colors.blue,
          size: sizeWidth * 0.08,
        ));
  }
}
