import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thecake_createorder/model/flavor_items.dart';

class Flavor extends StatefulWidget {
  @override
  _FlavorState createState() => _FlavorState();
}

class _FlavorState extends State<Flavor> {
  //Create variable checkbox
  bool flavorVal = false;
  List<String> nameflavor = [
    'ដូង',
    'ត្រាវ',
    'ស្លឹកតយ',

    'សុកូលា',
    'កាហ្វេ',
    'វ៉ាន់នីឡា',
    'ស្ទរប៊ឺរី',
    'ប្លូប៊ឺរី',
    'ឈ័ររី',
    'ត្នោត',
    'ល្ហុង',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        itemCount: 11,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return FlavorItems(
              nameflavor: nameflavor[index]
          );
        },
      ),
    );
  }
}
