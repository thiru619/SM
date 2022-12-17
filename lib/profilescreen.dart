import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sujithamatrimony/idverification.dart';
import 'package:sujithamatrimony/otppage.dart';

import 'package:sujithamatrimony/packages.dart';
import 'package:sujithamatrimony/preferencelist.dart';
import 'package:sujithamatrimony/privacy_policy.dart';
import 'package:sujithamatrimony/referralcode.dart';
import 'package:sujithamatrimony/settings.dart';
import 'package:sujithamatrimony/weddingservices.dart';

import 'package:get/get.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:http/http.dart' as http;
import 'edit_profiles.dart/edit_profile.dart';
import 'feedback.dart';
import 'main.dart';

class profilescreen extends StatefulWidget {
  const profilescreen({Key? key}) : super(key: key);

  @override
  State<profilescreen> createState() => _profilescreenState();
}

class _profilescreenState extends State<profilescreen> {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    super.initState();
    profile();
    getHomeProfilePic();
    // secureScreen();
  }

  var profilephoto;
  // var profile_pic;
  // var firstimage;

  // var id;
  bool status = true;
  bool isSwitchOn = false;

  TextEditingController namefield = TextEditingController();
  TextEditingController passwordfield = TextEditingController();
  final MyController con = Get.find();

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back))
                  ],
                ),
                height: 50,
                color: Colors.white,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(
                            color: Colors.transparent,
                            width: 30.0,
                            style: BorderStyle.solid),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: firstimage?['profile_image'] != null
                              ? NetworkImage("${firstimage['profile_image']}")
                              : AssetImage('assets/profile.png')
                                  as ImageProvider,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Column(
                  children: [
                    Text('$name'),
                    Text("$id"),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 25,
                      child: ElevatedButton(
                        child: Text(
                          "Upgrade membership".tr,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 255, 111, 0)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: Color.fromARGB(255, 255, 111, 0),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Packages()),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // print("j");Edit_profile
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Edit_profile()),
                              ).then((value) => {getHomeProfilePic()});
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Image(
                                    height: 20,
                                    image: AssetImage('assets/edit.png'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Edit Profile'.tr,
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
                                    builder: (context) => preferencelist()),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Image(
                                    height: 25,
                                    image: AssetImage('assets/person.png'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Edit Preferences'.tr,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // print("j");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const idverification()),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Image(
                                    height: 25,
                                    image: AssetImage('assets/verify.png'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Verify your Profile'.tr,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
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
                                    image: AssetImage('assets/chat.png'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Your Chats'.tr,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                    image: AssetImage('assets/call.png'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Your Calls'.tr,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // print("j");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const settings()),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Image(
                                    height: 25,
                                    image: AssetImage('assets/setting.png'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Settings'.tr,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                    image: AssetImage('assets/help.png'),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Help'.tr,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Feedback1()),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Image(
                                    height: 30,
                                    image: AssetImage('assets/feedback.png'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Feedback'.tr,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                    builder: (context) => weddingservices()),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Image(
                                    height: 25,
                                    image: AssetImage('assets/wedding.png'),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Wedding Services'.tr,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                    builder: (context) => Privacy_policy()),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Image(
                                    height: 20,
                                    image: AssetImage('assets/call.png'),
                                  ),
                                  SizedBox(
                                    width: 23,
                                  ),
                                  Text(
                                    'Privacy Policy / Terms & Conditions'.tr,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                    builder: (context) => const referralcode()),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Icon(Icons.share),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Share app'.tr,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () => share(),
                    //   child: Container(
                    //     child: Row(
                    //       children: [
                    //         Container(
                    //           // padding: const EdgeInsets.all(8),
                    //           child: Row(
                    //             children: [
                    // IconButton(
                    //     iconSize: 20,
                    //     onPressed: share,
                    //     icon: Icon(Icons.share)),
                    //               // SizedBox(
                    //               //   width: 10,
                    //               // ),
                    //               Text(
                    //                 'Share app'.tr,
                    //                 style:
                    //                     TextStyle(fontWeight: FontWeight.bold),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void profile() async {
    var pref = await SharedPreferences.getInstance();
    // name = pref.getString('username');
    id = pref.getString('login_id');

    setState(() {});
  }

  Future<void> getHomeProfilePic() async {
    var pref = await SharedPreferences.getInstance();
    // name = pref.getString('username');
    profilephoto = pref.getString('profilephoto');
    var url =
         baselink +"getHomeProfilePic";

    final MyController con = Get.find();
    var finalurl = Uri.parse(url);
    // var pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');

    print(regId);

    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      "reg_id": regId,
    });
    var decodeValue = jsonDecode(res.body);
    print(res.body);
    if (this.mounted) {
      setState(() {
        firstimage = decodeValue['data'];

        print(firstimage.toString());
        // print(matching_profile.toString());
      });
    }
  }
}
