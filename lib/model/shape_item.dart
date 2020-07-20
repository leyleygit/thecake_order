import 'package:flutter/material.dart';

class ShapeItem extends StatefulWidget {
  final String textshape;

  const ShapeItem({Key key, this.textshape}) : super(key: key);
  @override
  _ShapeItemState createState() => _ShapeItemState();
}

class _ShapeItemState extends State<ShapeItem> {
  bool checkshape = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      Padding(
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
                Text(widget.textshape, style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
  }
}
