import 'package:synag/ViewModel/Providers/provider_test.dart';

import '/ViewModel/Providers/provider_theme.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'Scaffold/provider_navigation_bar.dart';

class MyProvoders {
  static List<SingleChildWidget> get list => [
    ChangeNotifierProvider<ProviderTheme>(
      create:(context)=> ProviderTheme(),
    ),
    ChangeNotifierProvider<ProviderNavigationBar>(
      create:(context)=> ProviderNavigationBar(),
    ),
    /* ChangeNotifierProvider<ProviderOrientation>(
      create:(context)=> ProviderOrientation(),
    ),*/
         ChangeNotifierProvider<ProviderTest>(
      create:(context)=> ProviderTest(),
    ),
  ];
}
