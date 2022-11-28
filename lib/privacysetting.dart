import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
// import 'package:get/get.dart';
import 'package:custom_check_box/custom_check_box.dart';

import 'package:get/get.dart';
import 'package:sujithamatrimony/colors.dart';
import 'package:sujithamatrimony/languagecontroler.dart';

import 'language_btn.dart';

class privacysetting extends StatefulWidget {
  const privacysetting({Key? key}) : super(key: key);

  @override
  State<privacysetting> createState() => _privacysettingState();
}

class _privacysettingState extends State<privacysetting> {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    super.initState();
    // secureScreen();
  }

  var _result;
  bool isSwitchOn = false;
  bool value = false;
  String radioButtonItem = ' ';

  int id = 1;
  //  final MyController con = Get.find();
  gradientclr crl = gradientclr();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90), // here the desired height
          child: AppBar(
            bottom: TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 5.0, color: Colors.white),
              ),
              labelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  text: "Mobile",
                ),
                Tab(text: "Photo"),
              ],
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Privacy Settings", style: TextStyle(fontSize: 15),
              // style: TextStyle(color: Colors.orange),
            ),
            // automaticallyImplyLeading: false,
            actions: [
              Container(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Text(
                      "E ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 111, 0),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    LanguageBtn(),
                    Text(
                      " తె",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
            flexibleSpace: Container(
              decoration: crl.Decoration(),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Show mobile number only to:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 2,
                          top: 10,
                        ),
                        child: Text(
                          "All Paid member",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        height: 20,
                        child: ElevatedButton(
                          child: Text(
                            "Subscribers",
                            style: TextStyle(color: Colors.green),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: Colors.green,
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
                        width: 20,
                      ),
                      Radio(
                        value: 1,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'Yes';
                            id = 1;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 2,
                          top: 10,
                        ),
                        child: Text(
                          "paid members to my community",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 65,
                      ),
                      Radio(
                        value: 2,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'Yes';
                            id = 2;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 2,
                          top: 10,
                        ),
                        child: Text(
                          "Paid members whom I contacted",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Radio(
                        value: 3,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'Yes';
                            id = 3;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 2,
                          top: 10,
                        ),
                        child: Text(
                          "Don't show phone number (Hide",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Radio(
                        value: 4,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'Yes';
                            id = 4;
                          });
                        },
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " contact details)",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Page 1"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
