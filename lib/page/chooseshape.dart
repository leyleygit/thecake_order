import 'package:flutter/material.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // ignore: missing_required_param
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 48.0),
            child: InkWell(
              onTap: (){
                setState(() {
                  checkshape = !checkshape;
                });
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Text(textshape[index], style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                         Expanded(
                           child: Container(),
                         ),
                         checkshape == true
                          ? Icon(Icons.check_box ,color: Colors.white,)
                          : Icon(Icons.check_box_outline_blank, color: Colors.white,)
                    ],
                  ),
                ),
                width: size.width * 0.3,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(spreadRadius: 1,color: Colors.grey,offset: Offset(0.0,2.0),blurRadius: 3)],
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                        colors: [Color(0xffff0084), Color(0xfffc6767)])),
              ),
            ),
          );
        },
      ),
    );
  }
}
