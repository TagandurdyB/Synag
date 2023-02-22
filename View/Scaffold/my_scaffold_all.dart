import '../../ViewModel/routes_vm.dart';
import '/ViewModel/Providers/provider_theme.dart';
import 'package:flutter/material.dart';
import '/View/Scaffold/my_navigation_bar.dart';
import 'my_app_bar.dart';
import 'my_drawer.dart';

class ScaffoldAll extends StatelessWidget {
  final Widget body;
  final Widget? appBarLeading;
  final Function? funcBackBtn;
  final bool bottomDrawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  const ScaffoldAll(
      {required this.body,
      super.key,
      this.funcBackBtn,
      this.scaffoldKey,
      this.bottomDrawer = false,
      this.appBarLeading});
  @override
  Widget build(BuildContext context) {
    double bottomHeight = 0.0;
    if (bottomDrawer) {
      bottomHeight = kToolbarHeight + (kToolbarHeight * 0.5);
    } else {
      bottomHeight = kToolbarHeight;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        key: key,
        preferredSize: Size.fromHeight(bottomHeight),
        child: Container(
          decoration: BoxDecoration(
            color: ProviderTheme().colors.appBar,
            boxShadow: ProviderTheme().shadows.appBar,
          ),
          child: Column(
            children: [
              MyAppBar(
                  funcBackBtn: funcBackBtn,
                  bottomDrawer: bottomDrawer,
                  leading: appBarLeading),
              Visibility(
                visible:
                    bottomDrawer, //DistributorAppBar(context).bottomDrawer,
                child: Expanded(
                    child: Container(
                  color: DistributorTheme(context).colors.appBar,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: buildBottom(),
                )),
              )
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: body,
      //bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }

  Widget buildBottom() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [buildMenueBtn()],
      );

  Widget buildMenueBtn() => Builder(
        builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(Icons.menu)),
      );
}
