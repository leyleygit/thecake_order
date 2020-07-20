import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    return ListView.builder(itemCount: 7,scrollDirection: Axis.horizontal,itemBuilder: (_, int index){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        child: InkWell(
          onTap: (){
            setState(() {
              checkcolor = !checkcolor;
            });
          },
          child: Container(
            width: size.width * 0.35,
            height: size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    color: CupertinoColors.black.withOpacity(0.5),
                    blurRadius: 3.0,
                    offset: Offset(0.0, 2.0))
              ],
              gradient: LinearGradient(colors: [
                Color(0xffc31432),
                Color(0xff240b36),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    namecolor[index],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  checkcolor == true
                      ? Icon(Icons.check_box ,color: Colors.orangeAccent,)
                      : Icon(Icons.check_box_outline_blank, color: Colors.white,)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
