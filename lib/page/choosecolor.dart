import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseColor extends StatefulWidget {
  @override
  _ChooseColorState createState() => _ChooseColorState();
}

class _ChooseColorState extends State<ChooseColor> {
  List<String> namecolor = [
    "ពណ៍ក្រហម",
    "ពណ៍ខៀវ",
    "ពណ៍ទឹកក្រូច",
    "ពណ៍ត្នោត",
    "ពណ៍ខ្មៅ",
    "ពណ៍កាត់ស្តាំង",
    "ពណ៍ស្វាយ",
  ];
  List<String> namecolorE = [
    "R",
    "B",
    "O",
    "B",
    "B",
    "T",
    "P",
  ];
  List<Color> widgetcolors = [
    Colors.redAccent,
    Colors.lightBlueAccent,
    Colors.orange,
    Colors.brown,
    Colors.black54,
    Colors.teal,
    Colors.purpleAccent
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      backgroundColor: Colors.transparent,
      child: Container(
        height: size.height,
        child: CupertinoPicker(
          diameterRatio: 1.0,
          magnification: 1.1,
          itemExtent: 40,
          onSelectedItemChanged: (int index) {
            print(index);
          },
          children: List.generate(namecolor.length, (index) {
            return Container(
              height: 30,
              width: size.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.white.withOpacity(0.7),
                      child: Center(child: Text(namecolorE[index],style: TextStyle(color: widgetcolors[index]),)),
                    ),
                  ),
                  Text(
                    namecolor[index],
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: widgetcolors[index],
                  borderRadius: BorderRadius.circular(10.0)),
            );
          }),
        ),
      ),
    );
  }
}
