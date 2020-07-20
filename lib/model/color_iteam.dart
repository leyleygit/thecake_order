import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorItem extends StatefulWidget {
  final String namecolor;

  const ColorItem({Key key, this.namecolor}) : super(key: key);
  @override
  _ColorItemState createState() => _ColorItemState();
}

class _ColorItemState extends State<ColorItem> {
  bool checkcolor = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.namecolor,
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
  }
}
