import 'package:flutter/material.dart';
import 'package:thecake_createorder/model/shape_item.dart';

class ChooseShape extends StatefulWidget {
  @override
  _ChooseShapeState createState() => _ChooseShapeState();
}

class _ChooseShapeState extends State<ChooseShape> {
  bool checkshape = false;
  List<String> textshape = [
    'បេះដូង',
    'រង្វង់មូល',
    'ត្រីកោណ',
    'ឡាន',
    'ម៉ូតូ',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: missing_required_param
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: textshape.length,
        itemBuilder: (BuildContext context, int index) {
          return ShapeItem(textshape: textshape[index],);
        },
      ),
    );
  }
}
