import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:synag/View/Widgets/my_container.dart';
import 'package:synag/ViewModel/Providers/provider_test.dart';
import 'package:synag/ViewModel/names_vm.dart';
import 'package:synag/ViewModel/size_vm.dart';

class CounterWidget extends StatefulWidget {
  final int startValue;
  final int maxValue;
  final int minValue;
  final String name;
  const CounterWidget({
    super.key,
    required this.name,
    this.startValue = 0,
    this.maxValue = 10,
    this.minValue = 1,
  });

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int value = 0;
  @override
  void initState() {
    super.initState();
    value = widget.startValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildBtn(false),
          buildText(),
          buildBtn(true),
        ],
      ),
    );
  }

  Widget buildBtn(bool isadd) {
    return MyContainer(
      color: isadd ? Colors.blue : Colors.red,
      shape: MySize.width * 0.03,
      onTap: () => isadd ? plusFunc() : minusFunc(),
      child: isadd
          ? Icon(Icons.exposure_plus_1, size: MySize.width * 0.1)
          : Icon(Icons.exposure_minus_1, size: MySize.width * 0.1),
    );
  }

  final myCount = Hive.box(Names.count);

  void plusFunc() {
    setState(() {
      if (value < widget.maxValue) {
        value++;
        ProcessTest(context).changeCount(widget.name, value);
      }
    });
  }

  void minusFunc() {
    setState(() {
      if (value > widget.minValue) {
        value--;
        ProcessTest(context).changeCount(widget.name, value);
      }
    });
  }

  Widget buildText() {
    return MyContainer(
      color: Colors.transparent,
      child: Text(
        " $value ",
        style: TextStyle(fontSize: MySize.width * 0.1),
      ),
    );
  }
}
