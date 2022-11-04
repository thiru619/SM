import 'dart:math';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: sortby(),
    debugShowCheckedModeBanner: false,
  ));
}

class sortby extends StatefulWidget {
  const sortby({Key? key}) : super(key: key);

  @override
  State<sortby> createState() => _sortbyState();
}

class _sortbyState extends State<sortby> {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    super.initState();
    // secureScreen();
  }

  int index = 0;
  var random = Random();
  List<Image> myImage = [
    Image(
      image: AssetImage("assets/login.png"),
      color: Colors.red,
    ),
    Image(image: AssetImage("assets/login.png")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sort By",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image(
                              image: AssetImage("assets/login.png"),
                            ),
                          ),
                          Text("Last"),
                          Text("Login"),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image(
                              image: AssetImage("assets/calendar.png"),
                            ),
                          ),
                          Text("Date"),
                          Text("Created"),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image(
                              image: AssetImage("assets/circle.png"),
                            ),
                          ),
                          Text("Profile"),
                          Text("Relevancy"),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image(
                              image: AssetImage("assets/camera.png"),
                            ),
                          ),
                          Text("Latest"),
                          Text("Photos"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Filter By",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Text(
                        "Profile Type",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                      Text(
                        '---',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     child: TextField(
                  //       decoration: InputDecoration(
                  //         contentPadding: EdgeInsets.only(
                  //             top: 20), // add padding to adjust text
                  //         isDense: true,
                  //         hintText: "Profiles Created",
                  //         suffixIcon: Padding(
                  //           padding: EdgeInsets.only(
                  //               top: 15), // add padding to adjust icon
                  //           child: Icon(Icons.edit),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 20), // add padding to adjust text
                          isDense: true,
                          hintText: "Profiles Created",
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 15), // add padding to adjust icon
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 20), // add padding to adjust text
                          isDense: true,
                          hintText: "Show profiles",
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 15), // add padding to adjust icon
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 20), // add padding to adjust text
                          isDense: true,
                          hintText: "Profile created By",
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 15), // add padding to adjust icon
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 20), // add padding to adjust text
                          isDense: true,
                          hintText: "Don't show Profiles",
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 15), // add padding to adjust icon
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Basic Detials",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                      Text(
                        '---',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 20), // add padding to adjust text
                          isDense: true,
                          hintText: "Age",
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 15), // add padding to adjust icon
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 20), // add padding to adjust text
                          isDense: true,
                          hintText: "Height",
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 15), // add padding to adjust icon
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 20), // add padding to adjust text
                          isDense: true,
                          hintText: "Martial Status",
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 15), // add padding to adjust icon
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              top: 20), // add padding to adjust text
                          isDense: true,
                          hintText: "Mother Tongue",
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                                top: 15), // add padding to adjust icon
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 150,
              height: 40,
              child: ElevatedButton(
                child: Text(
                  "login",
                  style: TextStyle(fontSize: 20),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 255, 111, 0)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Color.fromARGB(255, 255, 111, 0),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => BottamBar(
                  //             currentindex: 0,
                  //           )),
                  // );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
