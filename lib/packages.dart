import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/colors.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:sujithamatrimony/prime_package.dart';
import 'package:sujithamatrimony/regular_package.dart';
import 'language_btn.dart';
import 'package:http/http.dart' as http;

import 'referralcode.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(
//     home: Packages(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

class Packages extends StatefulWidget {
  const Packages({Key? key}) : super(key: key);

  @override
  State<Packages> createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  // late Razorpay _razorpay;

  // var main_banner = [];
  var main_banner = [];
  var trail = [];
  var trailpremium = [];
  var mycolors = [
    Color.fromARGB(255, 165, 131, 82),
    Color.fromARGB(255, 248, 224, 86),
    Color.fromARGB(255, 229, 228, 226),
  ];
  @override
  void initState() {
    imgdata3();
  }

  final _selectedSegment_04 = ValueNotifier('3 Months');
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: Colors.white,

            bottom: TabBar(
              labelColor: Colors.green,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: "PRIME Packages",
                ),
                Tab(text: "Regular Packages"),
              ],
            ),
            // title: Text('TutorialKart - TabBar & TabBarView'),
          ),
          body: trailpremium.length != 0
              ? TabBarView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                // height: 150,
                                // width: 200.0,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                    gradient: LinearGradient(colors: [
                                      Colors.green,
                                      Color.fromARGB(255, 139, 180, 140)
                                    ]),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2.0,
                                          offset: Offset(2.0, 2.0))
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                        width: 100,
                                        image:
                                            AssetImage('assets/primelogo.png')),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Text(
                                        'Choose PRIME packages to connect with 100% ID-verified profiles. Plus, you get all the benefits to regular premium packages',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: AdvancedSegment(
                                sliderColor: Colors.green,
                                backgroundColor:
                                    Color.fromARGB(255, 226, 223, 223),
                                controller: _selectedSegment_04,
                                segments: {
                                  '3 Months': '3 Months',
                                  '6 Months': '6 Months',
                                  '12 Months': '12 Months',
                                },
                              ),
                            ),
                            SizedBox(
                              height: _height / 1.6,
                              child: Center(
                                child: ValueListenableBuilder<String>(
                                  valueListenable: _selectedSegment_04,
                                  builder: (_, key, __) {
                                    switch (key) {
                                      case '3 Months':
                                        return prime3m_package();
                                      case '6 Months':
                                        return prime6m_package();
                                      case '12 Months':
                                        return prime12m_package();
                                      default:
                                        return const SizedBox();
                                    }
                                  },
                                ),
                              ),
                            ),
                            Container(
                              height: 350,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              new BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 3.0,
                                              ),
                                            ]),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    trailpremium[index]['name'],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: _width / 4,
                                                  ),
                                                  Text(
                                                    trailpremium[index]
                                                        ['price'],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(Icons.message_outlined),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        width: 200,
                                                        child: Text(
                                                            trailpremium[index]
                                                                ['message']),
                                                      ),
                                                      // Text(
                                                      //     'chat and make Video Calls.')
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(Icons.mobile_friendly),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: 200,
                                                        child: Text(
                                                            trailpremium[index]
                                                                ['video']),
                                                      ),
                                                      // Text('numbers')
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Icon(Icons
                                                      .workspace_premium_outlined),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    children: [
                                                      SizedBox(
                                                        width: 200,
                                                        child: Text(
                                                            trailpremium[index]
                                                                ['content']),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(trailpremium[index]
                                                              ['referred_cnt']
                                                          .toString() +
                                                      "/" +
                                                      trailpremium[index]
                                                              ['referral_cnt']
                                                          .toString()),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        primary: Colors.orange,
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                    onPressed: () {
                                                      activate_free_trial(
                                                          trail[index]['id']);
                                                    },
                                                    // onPressed: () => payintegration(
                                                    //     main_banner3[index]
                                                    //         ['price'],
                                                    //     main_banner3[index]['id']),
                                                    child:
                                                        const Text('Activate'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 30,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            Text('* Terms & Conditions apply'),
                            SizedBox(
                              height: 30,
                            ),
                            // prime_package(),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                image: DecorationImage(
                                  image: AssetImage('assets/customer.png'),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  width: 5,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              SizedBox(
                                height: 30,
                              ),
                              AdvancedSegment(
                                sliderColor: Colors.green,
                                backgroundColor:
                                    Color.fromARGB(255, 226, 223, 223),
                                controller: _selectedSegment_04,
                                segments: {
                                  '3 Months': '3 Months',
                                  '6 Months': '6 Months',
                                  '12 Months': '12 Months',
                                },
                              ),
                              SizedBox(
                                height: _height / 1.6,
                                child: Center(
                                  child: ValueListenableBuilder<String>(
                                    valueListenable: _selectedSegment_04,
                                    builder: (_, key, __) {
                                      switch (key) {
                                        case '3 Months':
                                          return regular3m_package();
                                        case '6 Months':
                                          return regular6m_package();
                                        case '12 Months':
                                          return regular12m_package();
                                        default:
                                          return const SizedBox();
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                height: 400,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                new BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 3.0,
                                                ),
                                              ]),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      trail[index]['name'],
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: _width / 4,
                                                    ),
                                                    Text(
                                                      trail[index]['price'],
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Icon(
                                                        Icons.message_outlined),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                              trail[index]
                                                                  ['message']),
                                                        ),
                                                        // Text(
                                                        //     'chat and make Video Calls.')
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Icon(Icons.mobile_friendly),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                              trail[index]
                                                                  ['video']),
                                                        ),
                                                        // Text('numbers')
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Icon(Icons
                                                        .workspace_premium_outlined),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          width: 200,
                                                          child: Text(
                                                              trail[index]
                                                                  ['content']),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Center(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(trail[index]
                                                                ['referred_cnt']
                                                            .toString() +
                                                        "/" +
                                                        trail[index]
                                                                ['referral_cnt']
                                                            .toString()),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          primary:
                                                              Colors.orange,
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                      onPressed: () {
                                                        activate_free_trial(
                                                            trailpremium[index]
                                                                ['id']);
                                                      },
                                                      // onPressed: () => payintegration(
                                                      //     main_banner3[index]
                                                      //         ['price'],
                                                      //     main_banner3[index]['id']),
                                                      child: const Text(
                                                          'Activate'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              )
                            ])))
                  ],
                )
              : Container()),
    );
  }

  Future<void> imgdata3() async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/get_subscription";

    var finalurl = Uri.parse(url);

    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    });
    print(res.body);
    //  var decodeValue = json.decode(res.body);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');
    var body = {
      'reg_id': regId,
    };
    var decodeValue = json.decode(res.body);
    setState(() {
      print(decodeValue['status']);
      trail = decodeValue['data']['regular']["1"];
      trailpremium = decodeValue['data']['premium']["1"];

      print(trail.toString());
      print(trailpremium.toString());
    });
  }

  Future<void> activate_free_trial(subscription_id) async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/activate_free_trial";

    var finalurl = Uri.parse(url);

    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    });
    print(res.body);
    //  var decodeValue = json.decode(res.body);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');
    var body = {'reg_id': regId, 'subscription_id': subscription_id};
    var decodeValue = json.decode(res.body);
    setState(() {
      print(decodeValue['status']);
      Get.to(() => referralcode());
      Fluttertoast.showToast(
        msg: decodeValue['message'].toString(),
      );

      print(trail.toString());
    });
  }
}
