import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/bottomsheet.dart';
import 'package:sujithamatrimony/colors.dart';
import 'package:sujithamatrimony/idverification.dart';
import 'package:sujithamatrimony/loginpage.dart';
import 'package:sujithamatrimony/matches.dart';
import 'package:sujithamatrimony/newmatches_see_all.dart';
import 'package:sujithamatrimony/profilescreen.dart';
import 'package:sujithamatrimony/homescreen.dart';
import 'package:sujithamatrimony/view_profile.dart';
import 'package:sujithamatrimony/weddingservices.dart';
import 'chat.dart';
import 'package:get/get.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'edit_profiles.dart/edit_profile.dart';
import 'language_btn.dart';
import 'main.dart';
import 'matchingprofile_see_all.dart';
import 'otppage.dart';
import 'packages.dart';
import 'prime.dart';
import 'registration2.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';
import 'package:image_cropper/image_cropper.dart';

var viewdetails;
var imageSS;

class homescreens extends StatefulWidget {
  const homescreens({Key? key}) : super(key: key);

  @override
  State<homescreens> createState() => _homescreensState();
}

class _homescreensState extends State<homescreens>
    with SingleTickerProviderStateMixin {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }
//back button

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App'),
            content: Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text('No'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
                onPressed: () => Navigator.of(context).pop(true),
                //return true when click on "Yes"
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }
//back button

//  timer
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

//  timer
  bool status = true;

  var new_profile = [];
  var interested_profile = [];
  var matching_profile = [];
  // var profile_pic;
  var shortlisted_profile = [];
  var viewed_profile = [];
  // var name;
  var profilephoto;
  // bool loading = false;
  TextEditingController namefield = TextEditingController();
  TextEditingController passwordfield = TextEditingController();
  final MyController con = Get.find();
  @override
  void initState() {
    gethomes();
    // secureScreen();
    viewprofile();
    getHomeProfilePic();
    super.initState();
  }

  gradientclr crl = gradientclr();
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: () async {
          return showExitPopup();
        }, //call function on back button press
        child: Scaffold(
          backgroundColor: Colors.white,
          drawer: profilescreen(),
          onDrawerChanged: (bool dd) {
            getHomeProfilePic();
          },
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: crl.Decoration(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                // margin: EdgeInsets.only(left: 270),
                                padding: EdgeInsets.only(bottom: 0, top: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "E ",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 255, 111, 0),
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
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Stack(
                            alignment: AlignmentDirectional.centerStart,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  print("one");

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const prime()),
                                  );
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
                                            color: Color.fromARGB(
                                                255, 158, 21, 158),
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
                                      border: Border.all(
                                          width: 2, color: Colors.white),
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
                        Container(
                          height: 40,
                          margin: EdgeInsets.only(
                              top: 10, left: 20, right: 0, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                          image: firstimage?['profile_image'] !=
                                                  null
                                              ? NetworkImage(
                                                  "${firstimage['profile_image']}")
                                              : AssetImage('assets/profile.png')
                                                  as ImageProvider,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${greeting()}".tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "${name}".tr,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   width: 100,
                              // ),
                              Row(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Packages()));
                                          },
                                          icon: Icon(
                                            Icons.message_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) => IconButton(
                                            onPressed: () {
                                              Scaffold.of(context).openDrawer();
                                            },
                                            icon: Icon(
                                              Icons.subject,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Your Profile is Pending".tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Verification".tr +
                                              "                   ".tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: 23,
                                      child: ElevatedButton(
                                        child: Text(
                                          "Verify Now".tr,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Color.fromARGB(
                                                      255, 255, 111, 0)),
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    idverification()),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20)),
                                    border: Border.all(
                                        width: 0.5, color: Colors.grey),
                                    color: Colors.white),
                                child: Column(children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 320,
                                    constraints: BoxConstraints(
                                        maxHeight: double.infinity,
                                        maxWidth: double.infinity),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1, color: Colors.grey)),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                print("object");
                                              },
                                              icon: Image(
                                                image: AssetImage(
                                                    "assets/mic.png"),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   width: 10,
                                            // ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Sujitha Matrimony has".tr,
                                                  softWrap: true,
                                                ),
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Packages()),
                                                        );
                                                      },
                                                      child: Text(
                                                        "Free Trail".tr,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        softWrap: true,
                                                      ),
                                                    ),
                                                    Text(
                                                      " and ".tr,
                                                      softWrap: true,
                                                    ),
                                                    InkWell(
                                                      onFocusChange: null,
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  weddingservices()),
                                                        );
                                                      },
                                                      child: Text(
                                                        "Wedding services".tr,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.orange,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        softWrap: true,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "Matrimony Services".tr,
                                                  softWrap: true,
                                                )
                                              ],
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.arrow_right))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'New Matches'.tr,
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 57, 56, 56),
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                currentindex = 1;
                                                Get.offAll(bottomsheet(
                                                  currentIndex: 1,
                                                ));
                                                // print("one");
                                                // setState(() {
                                                //   bottomsheet();
                                                // });

                                                // Navigator.pushReplacement(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //       builder: (context) =>
                                                //           bottomsheet()),
                                                // );
                                              },
                                              child: Text(
                                                'See all'.tr,
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                softWrap: true,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: new_profile.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                margin:
                                                    EdgeInsets.only(right: 15),
                                                width: _width / 3.6,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        view_profile(
                                                                          profile:
                                                                              new_profile[index]['reg_id'].toString(),
                                                                        )));
                                                      },
                                                      child: Container(
                                                        // height: 80,
                                                        // width: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                            new_profile[index][
                                                                    'profile_image']
                                                                .toString(),
                                                            // fit: BoxFit.cover,
                                                          )),
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset:
                                                                  const Offset(
                                                                1.0,
                                                                1.0,
                                                              ), //Offset
                                                              blurRadius: 0.0,
                                                              spreadRadius: 0.0,
                                                            ), //BoxShadow
                                                            BoxShadow(
                                                              color:
                                                                  Colors.white,
                                                              offset:
                                                                  const Offset(
                                                                      0.0, 0.0),
                                                              blurRadius: 0.0,
                                                              spreadRadius: 0.0,
                                                            ),
                                                          ],
                                                        ),
                                                        height: _height / 7.66,
                                                        width: _width / 3.5,
                                                        // child: Image.network(
                                                        //   new_profile[index][
                                                        //           'profile_image']
                                                        //       .toString(),
                                                        //   fit: BoxFit.fill,
                                                        // )
                                                        // Image.asset("images/new_image.jpg",fit: BoxFit.fill,)
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            new_profile[index]
                                                                    ['name']
                                                                .toString(),

                                                            // "Atomic Hab",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Text(
                                                          new_profile[index]
                                                              ['dob'],
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                      // SizedBox(
                                      //   height: 20,
                                      // ),
                                      // viewdetails['basic_details']
                                      //             ['profile_percentage'] !=
                                      //         100
                                      // ?
                                      Container(
                                        width: 500.h,
                                        // padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: <Color>[
                                            Color.fromARGB(255, 85, 194, 94),
                                            Color.fromARGB(255, 10, 92, 16),
                                            Color.fromARGB(255, 10, 100, 25),
                                          ],
                                        )),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (viewdetails != null)
                                              Text(
                                                "  Your Profile is only " +
                                                    viewdetails['basic_details']
                                                            [
                                                            'profile_percentage']
                                                        .toString() +
                                                    " Complete".tr +
                                                    "           ".tr,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            Text(
                                              '  ' +
                                                  "Add below details to complete you profile"
                                                      .tr,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(10),
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      firstimage == null
                                                          ? Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "Please add you contact"
                                                                        .tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  Text(
                                                                    "profile with photos"
                                                                            .tr +
                                                                        "        "
                                                                            .tr,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 15,
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                85,
                                                                            height:
                                                                                20,
                                                                            child:
                                                                                ElevatedButton(
                                                                              child: Text(
                                                                                "Add photo".tr,
                                                                                style: TextStyle(fontSize: 11),
                                                                              ),
                                                                              style: ButtonStyle(
                                                                                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 111, 0)),
                                                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                                  RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(20),
                                                                                    side: BorderSide(
                                                                                      color: Color.fromARGB(255, 255, 111, 0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              onPressed: () {},
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                10,
                                                                          ),
                                                                          IconButton(
                                                                              onPressed: () {},
                                                                              icon: Image(image: AssetImage("assets/preview.png")))
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        "+25% in profile completeness"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                10),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          : Container(),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Get 10x more responses by "
                                                                  .tr,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "verifying your profile"
                                                                      .tr +
                                                                  "        ".tr,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "id proof".tr,
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              height: 12,
                                                            ),
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  // width: 110,
                                                                  height: 25,
                                                                  child:
                                                                      ElevatedButton(
                                                                    child: Text(
                                                                      "Get Your Profile Verified"
                                                                          .tr,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              11),
                                                                    ),
                                                                    style:
                                                                        ButtonStyle(
                                                                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(
                                                                          255,
                                                                          255,
                                                                          111,
                                                                          0)),
                                                                      shape: MaterialStateProperty
                                                                          .all<
                                                                              RoundedRectangleBorder>(
                                                                        RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20),
                                                                          side:
                                                                              BorderSide(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                255,
                                                                                111,
                                                                                0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                Edit_profile()),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                    onPressed:
                                                                        () {},
                                                                    icon: Image(
                                                                        image: AssetImage(
                                                                            "assets/shield.png")))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // : Container(),

                                      SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'People Interest to you'.tr,
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 57, 56, 56),
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                currentindex = 6;
                                                Get.offAll(bottomsheet(
                                                  currentIndex: 1,
                                                ));
                                              },
                                              child: Text(
                                                'See all'.tr,
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                softWrap: true,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                interested_profile.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                margin:
                                                    EdgeInsets.only(right: 15),
                                                width: _width / 3.6,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        view_profile(
                                                                          profile:
                                                                              interested_profile[index]['reg_id'].toString(),
                                                                        )));
                                                      },
                                                      child: Container(
                                                        // height: 80,
                                                        // width: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                              interested_profile[
                                                                          index]
                                                                      [
                                                                      'profile_image']
                                                                  .toString(),
                                                              // fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset:
                                                                  const Offset(
                                                                1.0,
                                                                1.0,
                                                              ), //Offset
                                                              blurRadius: 0.0,
                                                              spreadRadius: 0.0,
                                                            ), //BoxShadow
                                                            BoxShadow(
                                                              color:
                                                                  Colors.white,
                                                              offset:
                                                                  const Offset(
                                                                      0.0, 0.0),
                                                              blurRadius: 0.0,
                                                              spreadRadius: 0.0,
                                                            ),
                                                          ],
                                                        ),
                                                        height: _height / 7.66,
                                                        width: _width / 3.5,
                                                        // child: Image.network(
                                                        //   matching_profile[index][
                                                        //           'profile_image']
                                                        //       .toString(),
                                                        //   fit: BoxFit.cover,
                                                        // )
                                                        // Image.asset("images/new_image.jpg",fit: BoxFit.fill,)
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            interested_profile[
                                                                        index]
                                                                    ['name']
                                                                .toString(),

                                                            // "Atomic Hab",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Text(
                                                          interested_profile[
                                                              index]['dob'],
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'your Matching Profile'.tr,
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 57, 56, 56),
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                currentindex = 0;
                                                Get.offAll(bottomsheet(
                                                  currentIndex: 1,
                                                ));
                                              },
                                              child: Text(
                                                'See all'.tr,
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                softWrap: true,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: matching_profile.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                margin:
                                                    EdgeInsets.only(right: 15),
                                                width: _width / 3.6,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        view_profile(
                                                                          profile:
                                                                              matching_profile[index]['reg_id'].toString(),
                                                                        )));
                                                      },
                                                      child: Container(
                                                        // height: 80,
                                                        // width: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                              matching_profile[
                                                                          index]
                                                                      [
                                                                      'profile_image']
                                                                  .toString(),
                                                              // fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset:
                                                                  const Offset(
                                                                1.0,
                                                                1.0,
                                                              ), //Offset
                                                              blurRadius: 0.0,
                                                              spreadRadius: 0.0,
                                                            ), //BoxShadow
                                                            BoxShadow(
                                                              color:
                                                                  Colors.white,
                                                              offset:
                                                                  const Offset(
                                                                      0.0, 0.0),
                                                              blurRadius: 0.0,
                                                              spreadRadius: 0.0,
                                                            ),
                                                          ],
                                                        ),
                                                        height: _height / 7.66,
                                                        width: _width / 3.5,
                                                        // child: Image.network(
                                                        //   matching_profile[index][
                                                        //           'profile_image']
                                                        //       .toString(),
                                                        //   fit: BoxFit.cover,
                                                        // )
                                                        // Image.asset("images/new_image.jpg",fit: BoxFit.fill,)
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            matching_profile[
                                                                        index]
                                                                    ['name']
                                                                .toString(),

                                                            // "Atomic Hab",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Text(
                                                          matching_profile[
                                                              index]['dob'],
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  'Your Shortlisted Profile'.tr,
                                                  style: isSwitchOn == false
                                                      ? TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 57, 56, 56),
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold)
                                                      : TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 57, 56, 56),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                currentindex = 5;
                                                Get.offAll(bottomsheet(
                                                  currentIndex: 1,
                                                ));
                                              },
                                              child: Text(
                                                'See all'.tr,
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                softWrap: true,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                shortlisted_profile.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                margin:
                                                    EdgeInsets.only(right: 15),
                                                width: _width / 3.6,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        view_profile(
                                                                          profile:
                                                                              shortlisted_profile[index]['reg_id'].toString(),
                                                                        )));
                                                      },
                                                      child: Container(
                                                        // height: 80,
                                                        // width: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                              shortlisted_profile[
                                                                          index]
                                                                      [
                                                                      'profile_image']
                                                                  .toString(),
                                                              // fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset:
                                                                  const Offset(
                                                                1.0,
                                                                1.0,
                                                              ), //Offset
                                                              blurRadius: 5.0,
                                                              spreadRadius: 2.0,
                                                            ), //BoxShadow
                                                            BoxShadow(
                                                              color:
                                                                  Colors.white,
                                                              offset:
                                                                  const Offset(
                                                                      0.0, 0.0),
                                                              blurRadius: 0.0,
                                                              spreadRadius: 0.0,
                                                            ),
                                                          ],
                                                        ),
                                                        height: _height / 7.66,
                                                        width: _width / 3.5,
                                                        // child: Image.network(
                                                        //   matching_profile[index][
                                                        //           'profile_image']
                                                        //       .toString(),
                                                        //   fit: BoxFit.cover,
                                                        // )
                                                        // Image.asset("images/new_image.jpg",fit: BoxFit.fill,)
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            shortlisted_profile[
                                                                        index]
                                                                    ['name']
                                                                .toString(),

                                                            // "Atomic Hab",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Text(
                                                          shortlisted_profile[
                                                              index]['dob'],
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                isSwitchOn == true
                                                    ? Text(
                                                        'Your Viewed Profile'
                                                            .tr,
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    57,
                                                                    56,
                                                                    56),
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    : Text(
                                                        'Your Viewed Profile'
                                                            .tr,
                                                        style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 57, 56, 56),
                                                          fontSize: 18.0,
                                                        ),
                                                      )
                                              ],
                                            ),
                                            InkWell(
                                              onTap: () {
                                                currentindex = 4;
                                                Get.offAll(bottomsheet(
                                                  currentIndex: 1,
                                                ));
                                              },
                                              child: Text(
                                                'See all'.tr,
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                softWrap: true,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: viewed_profile.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                margin:
                                                    EdgeInsets.only(right: 15),
                                                width: _width / 3.6,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        view_profile(
                                                                          profile:
                                                                              viewed_profile[index]['reg_id'].toString(),
                                                                        )));
                                                      },
                                                      child: Container(
                                                        // height: 80,
                                                        // width: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                              viewed_profile[
                                                                          index]
                                                                      [
                                                                      'profile_image']
                                                                  .toString(),
                                                              // fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              offset:
                                                                  const Offset(
                                                                1.0,
                                                                1.0,
                                                              ), //Offset
                                                              blurRadius: 5.0,
                                                              spreadRadius: 2.0,
                                                            ), //BoxShadow
                                                            BoxShadow(
                                                              color:
                                                                  Colors.white,
                                                              offset:
                                                                  const Offset(
                                                                      0.0, 0.0),
                                                              blurRadius: 0.0,
                                                              spreadRadius: 0.0,
                                                            ),
                                                          ],
                                                        ),
                                                        height: _height / 7.66,
                                                        width: _width / 3.5,
                                                        // child: Image.network(
                                                        //   matching_profile[index][
                                                        //           'profile_image']
                                                        //       .toString(),
                                                        //   fit: BoxFit.cover,
                                                        // )
                                                        // Image.asset("images/new_image.jpg",fit: BoxFit.fill,)
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            viewed_profile[
                                                                        index]
                                                                    ['name']
                                                                .toString(),

                                                            // "Atomic Hab",
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Text(
                                                          viewed_profile[index]
                                                              ['dob'],
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  // Container(
                                  //   margin: EdgeInsets.only(right: 20),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.end,
                                  //     children: [
                                  //       IconButton(
                                  //         onPressed: () {
                                  //           Navigator.push(
                                  //             context,
                                  //             MaterialPageRoute(
                                  //                 builder: (context) =>
                                  //                     const Chats()),
                                  //           );
                                  //         },
                                  //         icon: Image(
                                  //           image: AssetImage(
                                  //               "assets/message.png"),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> gethomes() async {
    var pref = await SharedPreferences.getInstance();
    name = pref.getString('username');
    profilephoto = pref.getString('profilephoto');
    var url = baselink + "getHomePage";

    final MyController con = Get.find();
    var finalurl = Uri.parse(url);
    // var pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');

    print(regId);

    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      "reg_id": regId,
      'limit': '5',
    });
    var decodeValue = jsonDecode(res.body);
    pref.setString('username', decodeValue['data']['name'].toString());
    name = pref.getString('username');
    print(res.body);
    if (this.mounted) {
      setState(() {
        new_profile = decodeValue['data']['new_profile'];
        matching_profile = decodeValue['data']['matching_profile'];
        interested_profile = decodeValue['data']['interested_profile'];
        shortlisted_profile = decodeValue['data']['shortlisted_profile'];
        viewed_profile = decodeValue['data']['viewed_profile'];

        print(new_profile.toString());
        print(matching_profile.toString());
      });
    }
  }

  Future<void> getHomeProfilePic() async {
    var pref = await SharedPreferences.getInstance();
    name = pref.getString('username');

    profilephoto = pref.getString('profilephoto');
    var url = baselink + "getHomeProfilePic";

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

        print(new_profile.toString());
        print(matching_profile.toString());
      });
    }
  }

  Future<void> viewprofile() async {
    if (this.mounted) {
      setState(() {
        // loading = true;
      });
      var url = baselink + "get_view_profile";
      // checker(context) async {
      var pref = await SharedPreferences.getInstance();
      var regid = pref.getString('regsId');

      //  pref.setString('customer_id', data['data']['customer_id'].toString())
      // final MyController con = Get.find();

      //  print(id);
      var finalurl = Uri.parse(url);
      var res = await http.post(finalurl, headers: <String, String>{
        'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
      }, body: {
        'reg_id': regid,
      });

      print('hi' + res.body);
      // var decodeValue = json.decode(res.body);
      var decodeValue = json.decode(res.body);
      if (this.mounted) {
        setState(() {});
        if (decodeValue['status'] == true) {
          viewdetails = decodeValue['data'];
          imageSS = decodeValue['data']['profile_image_details'];

          print(viewdetails);
          // SharedPreferences pref = await SharedPreferences.getInstance();
          // pref.setString('temp_id', decodeValue['data']['user_temp_id'].toString());
          // Get.to(() => registration());

          // Fluttertoast.showToast(msg: decodeValue['message']);
        } else {
          Fluttertoast.showToast(msg: decodeValue['message']);
        }
        if (this.mounted) {
          setState(() {
            // loading = false;
          });
        }
      }
    }
  }
}
