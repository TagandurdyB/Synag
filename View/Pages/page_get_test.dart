import 'package:flutter/material.dart';

import '../Scaffold/my_scaffold_all.dart';

class GetTestPage extends StatelessWidget {
  const GetTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
      appBarLeading: const BackButton(),
      body: Container(),
    );
  }
}
