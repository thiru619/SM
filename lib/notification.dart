import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/colors.dart';
import 'package:sujithamatrimony/edit_profiles.dart/basic_detail.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:http/http.dart' as http;
import 'package:sujithamatrimony/view_profile.dart';
import 'language_btn.dart';

var notifications = [];

class notification extends StatefulWidget {
  const notification({Key? key}) : super(key: key);

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    super.initState();

    // secureScreen();
  }

  int _value = 0;
  bool isSwitchOn = false;

  //  final MyController con = Get.find();
  bool status = true;

  TextEditingController namefield = TextEditingController();
  TextEditingController passwordfield = TextEditingController();
  final MyController con = Get.find();
  gradientclr crl = gradientclr();
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "NOTIFICATIONS".tr,
            // style: TextStyle(color: Colors.orange),
          ),
          automaticallyImplyLeading: false,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              notifications == null || notifications.length == 0
                  ? Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Image(
                              height: 250,
                              color: Color.fromARGB(255, 209, 208, 208),
                              image: AssetImage(
                                'assets/notification.png',
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "You do not have any notifications.".tr,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    )
                  : Container(
                      height: 500,
                      child: ListView.builder(
                        itemCount: notifications.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => view_profile(
                                        profile: notifications[index]['reg_id']
                                            .toString(),
                                      )));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // borderRadius: BorderRadius.circular(20),
                                // boxShadow: [
                                //   BoxShadow(
                                //       color: Colors.grey,
                                //       // offset: Offset(1, 1),
                                //       blurRadius: 1,
                                //       spreadRadius: 1),
                                // ]
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(9),
                                    // margin: EdgeInsets.only(top: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              width: 1,
                                              color: Colors.white,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset: const Offset(
                                                  5.0,
                                                  5.0,
                                                ),
                                                blurRadius: 10.0,
                                                spreadRadius: 2.0,
                                              ), //BoxShadow
                                              BoxShadow(
                                                color: Colors.white,
                                                offset: const Offset(0.0, 0.0),
                                                blurRadius: 0.0,
                                                spreadRadius: 0.0,
                                              ), //BoxShadow
                                            ],
                                          ),
                                          child: Image(
                                              image: NetworkImage(
                                            notifications[index]
                                                    ['profile_image']
                                                .toString(),
                                            // fit: BoxFit.cover,
                                          )),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  notifications[index]['name']
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                      color: Color.fromARGB(
                                                          255, 51, 9, 75)),
                                                ),
                                                // Text(listprofile[index]['age'].toString(),),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),

                                            Row(
                                              children: [
                                                Text(
                                                  notifications[index]
                                                          ['datetime']
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  ", ",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  notifications[index]['for']
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '   You',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            // Row(
                                            //   children: [
                                            //     Text(
                                            //       notifications[index]['city']
                                            //           .toString(),
                                            //       style: TextStyle(
                                            //           fontWeight:
                                            //               FontWeight.bold),
                                            //     ),
                                            //     Text(
                                            //       ', ',
                                            //       style: TextStyle(
                                            //           fontWeight:
                                            //               FontWeight.bold),
                                            //     ),
                                            //     Text(
                                            //       notifications[index]['state']
                                            //           .toString(),
                                            //       style: TextStyle(
                                            //           fontWeight:
                                            //               FontWeight.bold),
                                            //     ),
                                            //   ],
                                            // ),
                                          ],
                                        )
                                      ],
                                    ),
                                    // margin: EdgeInsets.all(20),
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        // borderRadius: BorderRadius.all(),
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.grey,
                                        //     offset: const Offset(
                                        //       5,
                                        //       5,
                                        //     ),
                                        //     blurRadius: 6,
                                        //     spreadRadius: 1,
                                        //   ),
                                        // ],
                                        border: Border.all(width: 0.1)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
            ],
          ),
        ));
  }
}
