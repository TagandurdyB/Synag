import 'package:flutter/material.dart';
import 'package:synag/Model/test_element_model.dart';
import 'package:synag/View/Widgets/my_container.dart';
import 'package:synag/View/Widgets/pop_up_widget.dart';
import 'package:synag/ViewModel/Providers/Scaffold/provider_navigation_bar.dart';
import 'package:synag/ViewModel/Providers/provider_test.dart';
import 'package:synag/ViewModel/Providers/provider_theme.dart';
import 'package:synag/ViewModel/size_vm.dart';

// ignore: must_be_immutable
class QuestionScreen extends StatelessWidget {
  final ElemTest test;
  QuestionScreen({required this.test, super.key});

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.topRight,
              child: Text(
                "${ProcessTest(context).countSelectTest}/${DistributorNavigationBar(context).screenIndex + 1}",
                style: TextStyle(color: Colors.orange[500],fontSize: 18),
              ),
            ),
            Expanded(child: buildAsk(test.ask)),
            Expanded(child: buildChecks()),
          ]),
    );
  }

  Widget buildChecks() {
    List<Widget> checks = [
      CkeckBtn(ckeck: test.a, num: 1, answer: test.answer),
      CkeckBtn(ckeck: test.b, num: 2, answer: test.answer),
      CkeckBtn(ckeck: test.c, num: 3, answer: test.answer),
      CkeckBtn(ckeck: test.d, num: 4, answer: test.answer),
    ]..shuffle();

    checks.add(const SizedBox(height: 50));

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: checks,
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
}

// ignore: must_be_immutable
class CkeckBtn extends StatefulWidget {
  final int num;
  final int answer;
  Color color;
  final String ckeck;
  CkeckBtn(
      {this.answer = 0,
      this.ckeck = "",
      this.num = 0,
      this.color = Colors.grey,
      super.key});

  @override
  State<CkeckBtn> createState() => _CkeckBtnState();
}

class _CkeckBtnState extends State<CkeckBtn> {
  @override
  Widget build(BuildContext context) {
    return MyContainer(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 16),
      color: widget.color,
      onTap: () {
        if (ProcessTest(context).canCkeck) {
          ProcessTest(context).changeCheck(false);
          if (widget.num == widget.answer) {
            setState(() {
              widget.color = Colors.green;
            });
            ProcessTest(context).addTrue;
          } else {
            setState(() {
              widget.color = Colors.red;
            });
          }
          nextQuestion;
        }
      },
      borderColor: DistributorTheme(context).colors.text,
      shape: 10,
      child: Text(widget.ckeck,
          textAlign: TextAlign.center,
          style: DistributorTheme(context).styles.check),
    );
  }

  void get nextQuestion => {
        Future.delayed(const Duration(seconds: 3)).then((_) {
          final askIndex = ProcessNavigationBar(context).screenIndex + 1;
          ProcessTest(context).changeCheck(true);
          if (askIndex >= ProcessTest(context).countSelectTest) {
            popResult;
          } else {
            ProcessNavigationBar(context).changeIndex(askIndex);
          }
        })
      };

  void get popResult => PopUpWidget(
          title: "Netije",
          content: Container(
            child: buildResultDetal(),
          ),
          actionsTeam: [
            ActionsTeam(
                func: () {
                  Navigator.pop(context);
                  ProcessNavigationBar(context).changeIndex(0);
                },
                text: "OK")
          ]).popUpCupertino(context);

  Widget buildResultDetal() {
    final providT = ProcessTest(context);
    final int sum = providT.countSelectTest,
        trues = providT.trueCount,
        falses = sum - trues,
        degry = (trues * 100 / sum).round();
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: buildGrafic(degry),
      ),
      buildTexts("Jemi:", "$sum"),
      buildTexts("Bilinen:", "$trues"),
      buildTexts("Bilinmedik:", "$falses"),
    ]);
  }

  Widget buildGrafic(int degry) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: MySize.width * 0.4,
          height: MySize.width * 0.4,
          child: CircularProgressIndicator(
            semanticsValue: "${degry * 0.01}",
            //valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            strokeWidth: MySize.width * 0.04,
            color: Colors.green,
            backgroundColor: Colors.red,
            value: degry * 0.01,
          ),
        ),
        Text("$degry%", style: ProcessTheme(context).styles.check)
      ],
    );
  }

  Widget buildTexts(String name, String value) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(name, style: ProcessTheme(context).styles.check),
        Text(value, style: ProcessTheme(context).styles.check),
      ]);
}
