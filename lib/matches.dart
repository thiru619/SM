import 'package:flutter/material.dart';
// import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:get/get.dart';
import 'package:sujithamatrimony/chat.dart';
import 'package:sujithamatrimony/colors.dart';
import 'package:sujithamatrimony/common_matches.dart';
import 'package:sujithamatrimony/matches_tab.dart/listview_allmatch.dart';
import 'package:sujithamatrimony/matches_tab.dart/listview_intrest.dart';
import 'package:sujithamatrimony/matches_tab.dart/listview_matches.dart';
import 'package:sujithamatrimony/loginpage.dart';
import 'package:sujithamatrimony/matches_tab.dart/listview_short.dart';
import 'package:sujithamatrimony/matches_tab.dart/listview_view.dart';
import 'package:sujithamatrimony/matches_tab.dart/photo_allmatch.dart';
import 'package:sujithamatrimony/matches_tab.dart/photo_intrest.dart';
import 'package:sujithamatrimony/matches_tab.dart/photo_matches.dart';
import 'package:sujithamatrimony/matches_tab.dart/photo_short.dart';
import 'package:sujithamatrimony/matches_tab.dart/photo_view.dart';

import 'package:sujithamatrimony/prime.dart';
import 'package:sujithamatrimony/sortby.dart';
import 'language_btn.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

var currentindex = 0;

class matches extends StatefulWidget {
  @override
  _matchesState createState() => _matchesState();
}

class _matchesState extends State<matches> with TickerProviderStateMixin {
  // final _selectedSegment_05 = ValueNotifier('all');
  TabController? _tabController;
  int _value = 0;
  String radioButtonItem = ' ';
  int id = 1;
  // bool photoview = true;
  gradientclr crl = gradientclr();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: crl.Decoration(),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 101, 221, 105),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70), // here the desired height
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Container(
                // margin: EdgeInsets.only(bottom: 10),
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
                                  fontSize: 15,
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
                                    fontSize: 15,
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
            ),
            elevation: 0,
            flexibleSpace: Container(
              decoration: crl.Decoration(),
            ),
          ),
        ),
        body: DefaultTabController(
          length: 11,
          initialIndex: currentindex,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Material(
                  child: Container(
                    child: Container(
                      decoration: crl.Decoration(),
                      child: TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.black,
                        tabs: [
                          Tab(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(children: [
                                Text(
                                  "All".tr,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'Matches'.tr,
                                  style: TextStyle(fontSize: 12),
                                )
                              ]),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(children: [
                                Text(
                                  "New".tr,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'Matches'.tr,
                                  style: TextStyle(fontSize: 12),
                                )
                              ]),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(children: [
                                Text(
                                  "Premium".tr,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'Matches'.tr,
                                  style: TextStyle(fontSize: 12),
                                )
                              ]),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(children: [
                                Text(
                                  "Mutual".tr,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'Matches'.tr,
                                  style: TextStyle(fontSize: 12),
                                )
                              ]),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(children: [
                                Text(
                                  "Viewed".tr,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'You'.tr,
                                  style: TextStyle(fontSize: 12),
                                )
                              ]),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(children: [
                                Text(
                                  "Shortlisted".tr,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'You'.tr,
                                  style: TextStyle(fontSize: 12),
                                )
                              ]),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(children: [
                                Text(
                                  "Looking".tr,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'For You'.tr,
                                  style: TextStyle(fontSize: 12),
                                )
                              ]),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(children: [
                                Text(
                                  "Horoscope".tr,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'Matches'.tr,
                                  style: TextStyle(fontSize: 12),
                                )
                              ]),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(children: [
                                Text(
                                  "Viewed".tr,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'By You'.tr,
                                  style: TextStyle(fontSize: 12),
                                )
                              ]),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(children: [
                                Text(
                                  "Shortlisted".tr,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'By you'.tr,
                                  style: TextStyle(fontSize: 12),
                                )
                              ]),
                            ),
                          ),
                          Tab(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(children: [
                                Text(
                                  "Nearby".tr,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'Matches'.tr,
                                  style: TextStyle(fontSize: 12),
                                )
                              ]),
                            ),
                          ),
                        ],
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        indicator: RectangularIndicator(
                            bottomLeftRadius: 100,
                            bottomRightRadius: 100,
                            topLeftRadius: 100,
                            topRightRadius: 100,
                            color: Colors.green),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),

                  // color: Colors.amber,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Matches Yet to View".tr,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 80,
                      ),
                      // IconButton(
                      //     onPressed: () {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => const sortby()),
                      //       );
                      //     },
                      //     icon: Icon(
                      //       Icons.tune,
                      //       color: Colors.grey,
                      //       size: 20,
                      //     )),
                      //  SizedBox(
                      //   width: 20,
                      // ),
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  StatefulBuilder(builder: (context, setState) {
                                return SingleChildScrollView(
                                  child: Container(
                                    child: AlertDialog(
                                      // title: Text("Filter"),
                                      content: Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Container(
                                          // height: 50,
                                          child: Column(
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          icon: Icon(Icons
                                                              .arrow_back)),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "Display Settings  ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                // Container(
                                                //   child: Row(
                                                //     crossAxisAlignment:
                                                //         CrossAxisAlignment.start,
                                                //     children: [
                                                //       Text("Gender"),
                                                //     ],
                                                //   ),
                                                // ),
                                                Container(
                                                  // padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        'Matches Display',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'List View',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                    Text(
                                                                      'Default view where',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                    Text(
                                                                      'matches are displayed',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                    Text(
                                                                      ' in a list',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Radio(
                                                                  value: 1,
                                                                  groupValue:
                                                                      id,
                                                                  onChanged:
                                                                      (val) {
                                                                    setState(
                                                                        () {
                                                                      // radioButtonItem =
                                                                      //     'Yes';
                                                                      id = 1;
                                                                    });
                                                                  },
                                                                ),
                                                                SizedBox(
                                                                  width: 5,
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  // padding: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Photo View',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'View your matches with',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                    Text(
                                                                      'bigger photo',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Radio(
                                                                  value: 2,
                                                                  groupValue:
                                                                      id,
                                                                  onChanged:
                                                                      (val) {
                                                                    setState(
                                                                        () {
                                                                      // radioButtonItem =
                                                                      //     'Yes';
                                                                      id = 2;
                                                                    });
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ).then((value) {
                              setState(() {
                                id;
                              });
                            });
                          },
                          icon: Icon(
                            Icons.settings,
                            color: Colors.grey,
                            size: 20,
                          )),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 16,
                // ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      children: [
                        showDialog == null
                            ? common_matches()
                            : id == 1
                                ? listview_allmatch()
                                : photo_allmatch(),
                        id == 1 ? listview_matches() : photo_matches(),
                        common_matches(),
                        common_matches(),
                        id == 1 ? listview_view() : photo_view(),
                        id == 1 ? listview_short() : photo_short(),
                        id == 1 ? listview_intrest() : photo_intrest(),
                        common_matches(),
                        common_matches(),
                        common_matches(),
                        common_matches(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
