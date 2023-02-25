import 'package:flutter/material.dart';
import '/ViewModel/Providers/provider_theme.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  final Function? funcBackBtn;
  final Widget? leading;

  final List<Widget>? actions;
  final bool bottomDrawer;
  const MyAppBar(
      {super.key,
      this.actions,
      this.funcBackBtn,
      required this.bottomDrawer,
      this.leading});

  @override
  Widget build(BuildContext context) {
    final providerTheme = Provider.of<ProviderTheme>(context);
    return AppBar(
        leading: leading,
        actions: actions,
        centerTitle: true,
        title: providerTheme.texts
            .mainTitle //Text(providerTheme.texts.mainTitle, style: providerTheme.styles.appBar),
        );
  }
}
