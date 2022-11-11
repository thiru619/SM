import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:sujithamatrimony/prime_package.dart';
import 'package:sujithamatrimony/regular_package.dart';
import 'language_btn.dart';
import 'package:http/http.dart' as http;

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
  var mycolors = [
    Color.fromARGB(255, 165, 131, 82),
    Color.fromARGB(255, 248, 224, 86),
    Color.fromARGB(255, 229, 228, 226),
  ];
  @override
  void initState() {}

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
        body: TabBarView(
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
                                image: AssetImage('assets/primelogo.png')),
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
                        backgroundColor: Color.fromARGB(255, 226, 223, 223),
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
                      backgroundColor: Color.fromARGB(255, 226, 223, 223),
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
                    Text('* Terms & Conditions apply'),
                    SizedBox(
                      height: 30,
                    ),
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
          ],
        ),
      ),
    );
  }
}
