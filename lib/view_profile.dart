import 'dart:convert';

import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sujithamatrimony/colors.dart';
import 'package:sujithamatrimony/loginpage.dart';
import 'package:marquee/marquee.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:percent_indicator/percent_indicator.dart';

// import 'camera_preview.dart';

class view_profile extends StatefulWidget {
  var profile;
  var profile1;

  view_profile({Key? key, this.profile, this.profile1}) : super(key: key);

  @override
  State<view_profile> createState() => _view_profileState();
}

class _view_profileState extends State<view_profile> {
  @override
  void initState() {
    viewprofile();
    super.initState();
  }

  bool _hasBeenPressed1 = false;
  bool _hasBeenPressed = false;
  bool loading = false;
  bool onpress = true;
  bool onpress1 = true;
  bool onpress2 = true;
  bool onpress3 = true;
  bool onpress4 = true;
  bool onpress5 = true;
  bool onpress6 = true;
  bool onpress7 = true;
  bool onpress8 = true;
  bool onpress9 = true;
  bool onpress10 = true;
  bool onpress11 = true;
  bool onpress12 = true;
  bool onpress13 = true;

  var viewprofiles;

  @override
  Widget build(BuildContext context) {
    return viewprofiles != null
        ? DraggableHome(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded)),
            title: Text(
              viewprofiles['basics_details']['login_id'].toString(),
            ),
            actions: [
              Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        Uri phoneno = Uri.parse('tel:+97798345348734');
                        if (await launchUrl(phoneno)) {
                          //dialer opened
                        } else {
                          //dailer is not opened
                        }
                      },
                      icon: const Icon(Icons.call)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_sharp)),
                ],
              ),
            ],
            headerWidget: headerWidget(context),
            // headerBottomBar: headerBottomBarWidget(),
            body: [
              !loading
                  ? Container(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  viewprofiles['basics_details']['name']
                                      .toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      viewprofiles['basics_details']['age']
                                          .toString(),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      viewprofiles['basics_details']['city']
                                          .toString(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      viewprofiles['basics_details']['login_id']
                                          .toString(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: !_hasBeenPressed
                                              ? MaterialStateProperty.all(
                                                  Colors.green)
                                              : MaterialStateProperty.all(
                                                  Colors.orange),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.white),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            !_hasBeenPressed
                                                ? Text(
                                                    "Shortlist",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                : Text(
                                                    'Shortlisted',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                          ],
                                        ),
                                        // textColor: Colors.white,
                                        // 2
                                        //  color: !_hasBeenPressed
                                        //       ? Colors.orange
                                        //       : Colors.green,
                                        // 3
                                        onPressed: () => {
                                          setState(() {
                                            if (!_hasBeenPressed) {
                                              _hasBeenPressed = true;
                                            } else {
                                              _hasBeenPressed = false;
                                            }
                                            saveShortlistProfile(
                                                viewprofiles['basics_details']
                                                    ['reg_id']);
                                          })
                                        },
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: !_hasBeenPressed1
                                              ? MaterialStateProperty.all(
                                                  Colors.green)
                                              : MaterialStateProperty.all(
                                                  Colors.orange),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.favorite,
                                                color: Colors.white),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            _hasBeenPressed1
                                                ? Text(
                                                    "Interest",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                : Text(
                                                    'Interested',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                          ],
                                        ),
                                        // textColor: Colors.white,
                                        // 2
                                        // color: _hasBeenPressed1
                                        //     ? Colors.orange
                                        //     : Colors.green,
                                        // 3
                                        onPressed: () => {
                                          setState(() {
                                            _hasBeenPressed1 =
                                                !_hasBeenPressed1;
                                            saveInterestedProfile(
                                                viewprofiles['basics_details']
                                                    ['reg_id'],
                                                _hasBeenPressed1);
                                          })
                                        },
                                      ),
                                    ]),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'About You',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // print("j");Edit_profile
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           Edit_profile()),
                                          // );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.notes_rounded,
                                                color: Colors.green,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              viewprofiles['about_details']
                                                          ['profile'] !=
                                                      ''
                                                  ? Text(
                                                      viewprofiles[
                                                                  'about_details']
                                                              ['profile']
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: null,
                                                    )
                                                  : InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          if (onpress6) {
                                                            onpress6 = false;
                                                          } else {
                                                            onpress6 = true;
                                                          }
                                                        });
                                                      },
                                                      child: SizedBox(
                                                        width: 500,
                                                        child: Text(
                                                          onpress6
                                                              ? "Request About"
                                                              : "Requested About",
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: null,
                                                        ),
                                                      ),
                                                    )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.abc_outlined,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['about_details']
                                                    ['about_me'] !=
                                                ''
                                            ? SizedBox(
                                                width: 100,
                                                child: Text(
                                                  viewprofiles['about_details']
                                                          ['about_me']
                                                      .toString(),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (onpress13) {
                                                      onpress13 = false;
                                                    } else {
                                                      onpress13 = true;
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  onpress13
                                                      ? "Request About"
                                                      : "Requested About",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.contact_page_outlined,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['about_details']
                                                    ['maritial_status'] !=
                                                ''
                                            ? Text(viewprofiles['about_details']
                                                    ['maritial_status']
                                                .toString())
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (onpress11) {
                                                      onpress = false;
                                                    } else {
                                                      onpress11 = true;
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  onpress11
                                                      ? "Request State"
                                                      : "Requested State",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.swap_vert_circle_sharp,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        view_profile != null
                                            ? Text(viewprofiles['about_details']
                                                    ['mother_tongue']
                                                .toString())
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (onpress8) {
                                                      onpress8 = false;
                                                    } else {
                                                      onpress8 = true;
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  onpress8
                                                      ? "need to request"
                                                      : "need to requested",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_city,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['about_details']['city'] !=
                                                ''
                                            ? Text(viewprofiles['about_details']
                                                    ['city']
                                                .toString())
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (onpress9) {
                                                      onpress = false;
                                                    } else {
                                                      onpress9 = true;
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  onpress9
                                                      ? "Request City"
                                                      : "Requested City",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star_rate_outlined,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['about_details']
                                                    ['state'] !=
                                                ''
                                            ? Text(viewprofiles['about_details']
                                                    ['state']
                                                .toString())
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (onpress12) {
                                                      onpress12 = false;
                                                    } else {
                                                      onpress12 = true;
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  onpress12
                                                      ? "Request State"
                                                      : "Requested State",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_searching_outlined,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['about_details']
                                                    ['country'] !=
                                                ''
                                            ? Text(viewprofiles['about_details']
                                                    ['country']
                                                .toString())
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (onpress10) {
                                                      onpress = false;
                                                    } else {
                                                      onpress10 = true;
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  onpress10
                                                      ? "Request Country"
                                                      : "Requested Country",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['about_details']
                                                    ['ancestral_orgin'] !=
                                                ''
                                            ? Text(viewprofiles['about_details']
                                                    ['ancestral_orgin']
                                                .toString())
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (onpress) {
                                                      onpress = false;
                                                    } else {
                                                      onpress = true;
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  onpress
                                                      ? "Request Ancestral Orgin"
                                                      : "Requested Ancestral Orgin",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.dining_rounded,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['about_details']
                                                    ['eating_habits'] !=
                                                ''
                                            ? Text(viewprofiles['about_details']
                                                    ['eating_habits']
                                                .toString())
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (onpress) {
                                                      onpress = false;
                                                    } else {
                                                      onpress = true;
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  onpress
                                                      ? "Request Eating Habit"
                                                      : "Requested Eating Habit",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.sports_bar_rounded,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['about_details']
                                                    ['drinking_habits'] !=
                                                ''
                                            ? Text(viewprofiles['about_details']
                                                    ['drinking_habits']
                                                .toString())
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (onpress1) {
                                                      onpress1 = false;
                                                    } else {
                                                      onpress1 = true;
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  onpress1
                                                      ? "Request Drinking Habit"
                                                      : "Requested Drinking Habit",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.smoking_rooms_rounded,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['about_details']
                                                    ['smoking_habits'] !=
                                                ''
                                            ? Text(viewprofiles['about_details']
                                                    ['smoking_habits']
                                                .toString())
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (onpress2) {
                                                      onpress2 = false;
                                                    } else {
                                                      onpress2 = true;
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  onpress2
                                                      ? "Request Smoking Habits"
                                                      : "Requested Smoking Habits",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['basics_details']
                                                    ['mobile_no'] !=
                                                ''
                                            ? Text(
                                                viewprofiles['basics_details']
                                                        ['mobile_no']
                                                    .toString())
                                            : Text(
                                                'Request Mobile',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'Religious Background',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // print("j");Edit_profile
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           Edit_profile()),
                                          // );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.notes_rounded,
                                                color: Colors.green,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              viewprofiles['religious']
                                                          ['religion'] !=
                                                      null
                                                  ? Text(
                                                      viewprofiles['religious']
                                                              ['religion']
                                                          .toString())
                                                  : Text(
                                                      'Request to Religion',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.abc_outlined,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['religious']['caste'] !=
                                                null
                                            ? Text(viewprofiles['religious']
                                                    ['caste']
                                                .toString())
                                            : Text(
                                                'Request caste',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.contact_page_outlined,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['religious']
                                                    ['sub_caste'] !=
                                                null
                                            ? Text(viewprofiles['religious']
                                                    ['sub_caste']
                                                .toString())
                                            : Text(
                                                'Request to Sub caste',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['religious']['star'] != ''
                                            ? Text(viewprofiles['religious']
                                                    ['star']
                                                .toString())
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (onpress3) {
                                                      onpress3 = false;
                                                    } else {
                                                      onpress3 = true;
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  onpress3
                                                      ? "Request to Star"
                                                      : "Requested to Star",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.radio_button_on_sharp,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['religious']['raasi'] != ''
                                            ? Text(viewprofiles['religious']
                                                    ['raasi']
                                                .toString())
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (onpress4) {
                                                      onpress4 = false;
                                                    } else {
                                                      onpress4 = true;
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  onpress4
                                                      ? "Request to Raasi"
                                                      : "Requested to Raasi",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.radar,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['religious']['zodiac'] !=
                                                ''
                                            ? Text(viewprofiles['religious']
                                                    ['zodiac']
                                                .toString())
                                            : InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    if (onpress5) {
                                                      onpress5 = false;
                                                    } else {
                                                      onpress5 = true;
                                                    }
                                                  });
                                                },
                                                child: Text(
                                                  onpress5
                                                      ? "Request to Zodiac"
                                                      : "Requested to Zodiac",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'Professional details',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // print("j");Edit_profile
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           Edit_profile()),
                                          // );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.emoji_flags_sharp,
                                                color: Colors.green,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              viewprofiles['professional']
                                                          ['employed_in'] !=
                                                      ''
                                                  ? Text(viewprofiles[
                                                              'professional']
                                                          ['employed_in']
                                                      .toString())
                                                  : Text(
                                                      'Request employed In',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.abc_outlined,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['professional']
                                                    ['annual_income'] !=
                                                ''
                                            ? Text(viewprofiles['professional']
                                                    ['annual_income']
                                                .toString())
                                            : Text(
                                                'Request annual Icome',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.contact_page_outlined,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['professional']
                                                    ['occupation'] !=
                                                ''
                                            ? Text(viewprofiles['professional']
                                                    ['occupation']
                                                .toString())
                                            : Text(
                                                'Request to occupation',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.contact_page_outlined,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['professional']
                                                    ['education'] !=
                                                ''
                                            ? Text(viewprofiles['professional']
                                                    ['education']
                                                .toString())
                                            : Text(
                                                'Request education',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'Family details',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // print("j");Edit_profile
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           Edit_profile()),
                                          // );
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons
                                                    .signal_wifi_statusbar_null_rounded,
                                                color: Colors.green,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              viewprofiles['family']
                                                          ['family_status'] !=
                                                      ''
                                                  ? Text(viewprofiles['family']
                                                          ['family_status']
                                                      .toString())
                                                  : Text(
                                                      'Request family status',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.merge_type,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['family']['family_type'] !=
                                                ''
                                            ? Text(viewprofiles['family']
                                                    ['family_type']
                                                .toString())
                                            : Text(
                                                'Request family Type',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // print("j");Edit_profile
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           Edit_profile()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.vertical_align_top_rounded,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        viewprofiles['family']
                                                    ['family_values'] !=
                                                ''
                                            ? Text(viewprofiles['family']
                                                    ['family_values']
                                                .toString())
                                            : Text(
                                                'Request to family value',
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
                          ],
                        ),
                      ),
                    )
                  : CircularProgressIndicator()
              // MaterialButton(
              //     color: Colors.blueAccent,
              //     child: Text("Linear Library"),
              //     onPressed: () {}),
            ],
            fullyStretchable: true,
            // expandedBody: const CameraPreview(),
            backgroundColor: Colors.white,
            appBarColor: Colors.green,
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  Row headerBottomBarWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.list,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return SafeArea(
      child: Image(
        fit: BoxFit.fill,
        image: NetworkImage(
          viewprofiles['basics_details']['profile_image'].toString(),
        ),
      ),
    );
  }

  Future<void> viewprofile() async {
    setState(() {
      loading = true;
    });
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/get_profile_details";
    // checker(context) async {
    var pref = await SharedPreferences.getInstance();
    var regid = widget.profile;

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
    setState(() {});
    if (decodeValue['status'] == true) {
      viewprofiles = decodeValue['data'];
      _hasBeenPressed = viewprofiles['basics_details']['shortlisted'];
      // _hasBeenPressed
      print(viewprofiles);
      // SharedPreferences pref = await SharedPreferences.getInstance();
      // pref.setString('temp_id', decodeValue['data']['user_temp_id'].toString());
      // Get.to(() => registration());

      // Fluttertoast.showToast(msg: decodeValue['message']);
    } else {
      Fluttertoast.showToast(msg: decodeValue['message']);
    }
    setState(() {
      loading = false;
    });
  }

  Future<void> saveShortlistProfile(profileid) async {
    // setState(() {
    //   loading = true;
    // });
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/saveShortlistProfile";
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
      'register_id': regid,
      'shortlisted_profile_id': profileid,
    });

    print('hi' + res.body);
    // var decodeValue = json.decode(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {});
    if (decodeValue['status'] == true) {
      // viewprofiles = decodeValue['data'];
      print(viewprofiles);
      // SharedPreferences pref = await SharedPreferences.getInstance();
      // pref.setString('temp_id', decodeValue['data']['user_temp_id'].toString());
      // Get.to(() => registration());

      // Fluttertoast.showToast(msg: decodeValue['message']);
    } else {
      Fluttertoast.showToast(msg: decodeValue['message']);
    }
    // setState(() {
    //   loading = false;
    // });
  }

  Future<void> saveInterestedProfile(profileids, status) async {
    // setState(() {
    //   loading = true;
    // });
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/saveInterestedProfile";
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
      'register_id': regid,
      'interested_profile_id': profileids,
      'status': status ? "1" : "0",
    });

    print('hi' + res.body);
    // var decodeValue = json.decode(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {});
    if (decodeValue['status'] == true) {
      // viewprofiles = decodeValue['data'];
      print(viewprofiles);
    } else {
      Fluttertoast.showToast(msg: decodeValue['message']);
    }
    // setState(() {
    //   loading = false;
    // });
  }
}
