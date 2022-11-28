import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:sujithamatrimony/bottomsheet.dart';

import 'package:get/get.dart';
import 'package:sujithamatrimony/languagecontroler.dart';

import 'language_btn.dart';

class prime extends StatefulWidget {
  const prime({Key? key}) : super(key: key);

  @override
  State<prime> createState() => _primeState();
}

class _primeState extends State<prime> with SingleTickerProviderStateMixin {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  final List<String> document = [
    'Pan Card',
    'Aadhaar',
    'Driving Liscense',
    'Passport',
    'Passport',
    'voter Id',
  ];
  String? documentValue;

  TabController? tabController;
  //  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    // secureScreen();
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  bool isSwitchOn = false;

  bool status = true;

  TextEditingController namefield = TextEditingController();
  TextEditingController passwordfield = TextEditingController();
  final MyController con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: profilescreen(),
      body: SafeArea(
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromARGB(255, 189, 112, 240),
                  Color.fromARGB(255, 79, 22, 112),
                  Color.fromARGB(255, 49, 7, 66),
                ],
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(bottom: 0, top: 15),
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
                          SizedBox(
                            width: 250,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 90,
                              ),
                              Text(
                                "PRIME".tr,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 158, 21, 158),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          width: 145,
                          height: 30,
                          // color: Colors.red,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: GestureDetector(
                          onTap: () {
                            print("two");
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                            ),
                            width: 80,
                            height: 30,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Regular".tr,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Introducting'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  'Sujitha Matrimony PRIME'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Be a part of PRIME for free with these".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "simple steps:".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              "Add your photo to join the exclusive club".tr +
                                  "          ".tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: ElevatedButton(
                                    child: Text(
                                      "Upload photo".tr,
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color.fromARGB(255, 255, 111, 0)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side: BorderSide(
                                            color: Color.fromARGB(
                                                255, 255, 111, 0),
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
                              ],
                            ),
                          ],
                        )
                      ]),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
