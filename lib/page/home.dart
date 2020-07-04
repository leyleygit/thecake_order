import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thecake_createorder/page/choosecolor.dart';
import 'package:thecake_createorder/page/chooseflavor.dart';
import 'package:thecake_createorder/page/chooseprice.dart';

//Creat Order
class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage>
    with TickerProviderStateMixin {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  String _searchText = "";
  TextEditingController _searchController;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Color'),
    Tab(text: 'Shape'),
    Tab(text: 'Flavor')
  ];
  TabController _tabbarcontroller;
  @override
  void initState() {
    _tabbarcontroller = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.orange,
            leading: Icon(Icons.backspace),
            title: Text("The Cake"),
            actions: <Widget>[
              Container(
                width: size.width * 0.3,
                child: Center(
                  child: Text(
                    "Create Order",
                    style: GoogleFonts.kronaOne(
                        color: Colors.orange, fontSize: 12),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0)),
                  color: Colors.white,
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "បញ្ចូលរូបភាព",
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  height: size.height * 0.2,
                  child: ListView.builder(
                      itemCount: 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: getImage,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange),
                                borderRadius: BorderRadius.circular(20)),
                            width: 100,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.orange,
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //choose price
                Container(
                  width: size.width / 2.5,
                  height: size.height * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "ជ្រើសរើសតម្លៃនំ",
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10.0)),
                            width: size.width * 0.35,
                            height: size.height * 0.06,
                            child: Center(
                                child: Text(
                              "Choose Price",
                              style: GoogleFonts.kronaOne(color: Colors.white),
                            )),
                          ),
                          onTap: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) {
                                  return CupertinoActionSheet(
                                    actions: <Widget>[
                                      CupertinoActionSheetAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("យល់ព្រម"),
                                      )
                                    ],
                                    title: Text(
                                      "តម្លៃនំ​",
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.orange),
                                    ),
                                    message: Container(
                                      width: size.width,
                                      height: size.height * 0.1,
                                      child: ChoosePrice(),
                                    ),
                                    cancelButton: CupertinoActionSheetAction(
                                      isDefaultAction: true,
                                      isDestructiveAction: true,
                                      child: Text('បដិសេដ'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  );
                                });
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: size.width / 2,
                  height: size.height * 0.15,
                  //color: Colors.purpleAccent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "ជ្រើសរើសអតិធិជន",
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: size.width * 0.5,
                          height: 55,
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                                fillColor: Colors.brown,
                                labelText: "Search",
                                hintText: "​ឈ្មោះ ឬ លេខទូរស័ព្ទ​​​",
                                labelStyle: TextStyle(color: Colors.orange),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.orange,
                                ),
                                suffixIcon: _searchText.isNotEmpty
                                    ? IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          setState(() {
                                            _searchController.clear();
                                          });
                                        },
                                      )
                                    : null,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange))),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "បន្ថែមពត៍មានលើនំ",
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.3,
                    child: TextField(
                      minLines: 10,
                      maxLines: 15,
                      decoration: InputDecoration(
                          hintText: 'បន្ថែមពត៍មាននៅទីនេះ .....',
                          border: OutlineInputBorder(
                            gapPadding: 100.0,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange))),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              //TabBar & Tab view
              child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "ជ្រើសរើសលក្ខណះនំ",
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  margin: EdgeInsets.only(top: 10),
                  child: Container(
                    height: size.height * 0.05,
                    child: TabBar(
                      controller: _tabbarcontroller,
                      unselectedLabelStyle:
                          TextStyle(letterSpacing: 0, fontSize: 17),
                      labelStyle: TextStyle(letterSpacing: 2),
                      unselectedLabelColor: Colors.black54,
                      indicator: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(5.0)),
                      tabs: <Widget>[
                        Text("រសជាតិ"),
                        Text("ពណ៍"),
                        Text("រូបរាង")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.2,
                  child: Card(
                    child: TabBarView(
                      controller: _tabbarcontroller,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Flavor(),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.purpleAccent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5.0)),
                          child: ChooseColor(),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5.0)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
