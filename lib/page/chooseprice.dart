import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoosePrice extends StatefulWidget {
  @override
  _ChoosePriceState createState() => _ChoosePriceState();
}

class _ChoosePriceState extends State<ChoosePrice> {
  List<String> moneys = [
    '5 \$',
    '10 \$',
    '15 \$',
    '20 \$',
    '25 \$',
    '30 \$',
    '35 \$',
    '40 \$'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      backgroundColor: Colors.transparent,
      child: Container(
        height: size.height,
        child: CupertinoPicker(
            itemExtent: 25,
            onSelectedItemChanged: (int index) {
              print(index);
            },
            children: List.generate(moneys.length, (index) {
              return Text(
                moneys[index],
                style: TextStyle(color: Colors.orange),
              );
            })),
      ),
    );
  }
}
