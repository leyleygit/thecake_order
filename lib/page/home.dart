import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thecake_createorder/page/choosecolor.dart';
import 'package:thecake_createorder/page/chooseflavor.dart';
import 'package:thecake_createorder/page/chooseprice.dart';
import 'package:thecake_createorder/page/chooseshape.dart';

//Create Order
class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage>
    with TickerProviderStateMixin {
  List<File> _image;
  final picker = ImagePicker();

  String _searchText = "";
  TextEditingController _searchController;
  List<String> moneys = [
    'Choose Price',
    '5 \$',
    '10 \$',
    '15 \$',
    '20 \$',
    '25 \$',
    '30 \$',
    '35 \$',
    '40 \$'
  ];
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Color'),
    Tab(text: 'Shape'),
    Tab(text: 'Flavor')
  ];
  TabController _tabbarcontroller;
  @override
  void initState() {
    _image = [];
    _tabbarcontroller = TabController(vsync: this, length: 3);
    super.initState();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image.add(File(pickedFile.path));
    });
  }

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image.add(File(pickedFile.path));
    });
  }

  int curIndex = 0;
  bool tapped = false;
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
                      itemCount: _image.length + 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return index == 0
                            ? InkWell(
                                onTap: getImage,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.orange),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    width: 100,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: GestureDetector(
                                  onLongPress: () {
                                    setState(() {
                                      _image.removeAt(index - 1);
                                    });
                                  },
                                  child: Container(
                                    width: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              _image[index - 1].path),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
                              " ${moneys[curIndex]}",
                              style: GoogleFonts.kronaOne(color: Colors.white),
                            )),
                          ),
                          onTap: () async {
                            await showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) {
                                  return CupertinoActionSheet(
                                    actions: <Widget>[
                                      CupertinoActionSheetAction(
                                        onPressed: () {
                                          setState(() {
                                            tapped = true;
                                          });
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
                                      height: size.height * 0.3,
                                      child: CupertinoPicker(
                                          itemExtent: 50,
                                          onSelectedItemChanged: (int index) {
                                            setState(() {
                                              curIndex = index;
                                            });
                                          },
                                          children: List.generate(moneys.length,
                                              (index) {
                                            return Center(
                                              child: Text(
                                                moneys[index],
                                                style: TextStyle(
                                                    color: Colors.orange),
                                              ),
                                            );
                                          })),
                                    ),
                                    cancelButton: CupertinoActionSheetAction(
                                      isDefaultAction: true,
                                      isDestructiveAction: true,
                                      child: Text('បដិសេដ'),
                                      onPressed: () {
                                        setState(() {
                                          curIndex = 0;
                                        });
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
                          height: size.height * 0.08,
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
                      maxLines: 15,
                      keyboardType: TextInputType.text,
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
                          child: ChooseShape(),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getImageGallery();
          });
        },
        backgroundColor: Colors.orange,
        child: Icon(Icons.camera_enhance),
      ),
    );
  }
}
