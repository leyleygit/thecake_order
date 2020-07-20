import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thecake_createorder/model/color_iteam.dart';

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
  bool checkcolor = false;
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    // ignore: missing_required_param
    return ListView.builder(itemCount: namecolor.length,scrollDirection: Axis.horizontal,itemBuilder: (_, int index){
      return ColorItem(namecolor: namecolor[index],);
    });
  }
}
