import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlavorItems extends StatefulWidget {
  final String nameflavor;

  const FlavorItems({Key key, this.nameflavor}) : super(key: key);
  @override
  _FlavorItemsState createState() => _FlavorItemsState();
}

class _FlavorItemsState extends State<FlavorItems> {
  bool flavorVal = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: InkWell(
        onTap: () {
          setState(() {
            flavorVal = !flavorVal;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: size.width * 0.27,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    color: CupertinoColors.black.withOpacity(0.5),
                    blurRadius: 3.0,
                    offset: Offset(0.0, 2.0))
              ],
              gradient: LinearGradient(colors: [
                Color(0xff9CECFB),
                Color(0xff0052D4),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(30.0)),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.nameflavor,
                style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Container(),
              ),
              flavorVal == true
                  ? Icon(Icons.check_box ,color: Colors.orangeAccent,)
                  : Icon(Icons.check_box_outline_blank, color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
