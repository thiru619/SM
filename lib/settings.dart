import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/changepass.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:sujithamatrimony/colors.dart';
import 'package:sujithamatrimony/loginpage.dart';
import 'package:sujithamatrimony/oldtonew_pass.dart';
import 'language_btn.dart';
import 'privacysetting.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    super.initState();
    log();
    // secureScreen();
  }

  var temp_id;
  log() async {
    var pref = await SharedPreferences.getInstance();
    temp_id = pref.getString('regsId');
    setState(() {});
    print(temp_id);
  }

  int _value = 0;
  bool isSwitchOn = false;
  bool status = false;
  //  final MyController con = Get.find();
  gradientclr crl = gradientclr();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Settings",
          // style: TextStyle(color: Colors.orange),
        ),
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
                      color: Color.fromARGB(255, 0, 84, 6),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("j");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const privacysetting()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Image(
                              height: 25,
                              image: AssetImage(
                                'assets/privacy.png',
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Privacy Settings',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // print("j");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => oldtonew_pass()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Image(
                              height: 25,
                              image: AssetImage(
                                'assets/changepass.png',
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Change Password',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (temp_id != null)
                Container(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // print("j");
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  StatefulBuilder(builder: (context, setState) {
                                    return AlertDialog(
                                      title: Text(
                                        "Are you sure to Signout ?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                height: 40,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 255, 111, 0),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  // => setState(() => _value = 0),
                                                  child: Container(
                                                    height: 96,
                                                    width: 120,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 1,
                                                        color: Color.fromARGB(
                                                            255, 255, 111, 0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Text(
                                                      "No",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15),
                                                    ),
                                                    alignment: Alignment.center,
                                                  ),
                                                )),
                                            Container(
                                              height: 40,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 255, 111, 0),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color.fromRGBO(
                                                            212, 133, 13, 1)
                                                        .withOpacity(0.5),
                                                    // spreadRadius: 5,
                                                    blurRadius: 6,
                                                    offset: Offset(0,
                                                        1), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: GestureDetector(
                                                onTap: () async {
                                                  var pref =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  await pref.clear();
                                                  Navigator.pushAndRemoveUntil<
                                                      dynamic>(
                                                    context,
                                                    MaterialPageRoute<dynamic>(
                                                      builder: (BuildContext
                                                              context) =>
                                                          loginpage(),
                                                    ),
                                                    (route) =>
                                                        false, //if you want to disable back feature set to false
                                                  );
                                                },
                                                //  => setState(() => _value = 1),
                                                child: Container(
                                                  height: 96,
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Color.fromARGB(
                                                          255, 255, 111, 0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Text(
                                                    "Yes",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  alignment: Alignment.center,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Image(
                                height: 25,
                                image: AssetImage(
                                  'assets/signout.png',
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Sign Out',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // print("j");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Image(
                              height: 25,
                              image: AssetImage('assets/delete.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Delete Account',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // print("j");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Image(
                              height: 25,
                              image: AssetImage('assets/deactivate.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Deactivate Account',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
