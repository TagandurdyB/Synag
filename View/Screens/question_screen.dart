import 'package:flutter/material.dart';
import 'package:synag/Model/test_element_model.dart';
import 'package:synag/View/Widgets/my_container.dart';
import 'package:synag/ViewModel/Providers/Scaffold/provider_navigation_bar.dart';
import 'package:synag/ViewModel/Providers/provider_test.dart';
import 'package:synag/ViewModel/Providers/provider_theme.dart';

class QuestionScreen extends StatefulWidget {
  final ElemTest test;
  final int count;
  const QuestionScreen({
    this.count = 0, required this.test, super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: buildAsk(widget.test.ask)),
            Expanded(child: buildChecks()),
          ]),
    );
  }

  Widget buildChecks() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          buildCheck(widget.test.a, 0, Colors.grey),
          buildCheck(widget.test.b, 1, Colors.grey),
          buildCheck(widget.test.c, 2, Colors.grey),
          buildCheck(widget.test.d, 3, Colors.grey),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget buildAsk(String ask) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Text(ask,
            textAlign: TextAlign.center,
            style: DistributorTheme(context).styles.question),
      ),
    );
  }

  
  Widget buildCheck(String check, int index, Color color) {
    return MyContainer(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: color,
      onTap: () {
        if (index == widget.test.answer) {
          setState(() {
            color = Colors.green;
          });
          debugPrint("+++*+*+*true");
        } else {
          setState(() {
            color = Colors.red;
          });
          debugPrint("+++*+*+*false");
        }
        Future.delayed(const Duration(seconds: 3)).then((value) {
          final askIndex=ProcessNavigationBar(context).screenIndex+1;
          ProcessNavigationBar(context).changeIndex(askIndex);
           debugPrint("next $askIndex");
          if (askIndex >= widget.count) {
            ProcessNavigationBar(context).changeIndex(0);
            Navigator.pop(context);
          }
        });
      },
      borderColor: DistributorTheme(context).colors.text,
      shape: 10,
      child: Text(check,
          textAlign: TextAlign.center,
          style: DistributorTheme(context).styles.check),
    );
  }
}
