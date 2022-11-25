import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sujithamatrimony/colors.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:sujithamatrimony/preferencelist.dart';
import 'package:sujithamatrimony/profilefor.dart';
import 'bottomsheet.dart';
import 'language_btn.dart';
import 'registration2.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';

var baseurl =
    'http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/';

class registration extends StatefulWidget {
  const registration({Key? key}) : super(key: key);

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   secureScreen();

  // }

  String? selectvalue;

  bool status = true;
  bool isSwitchOn = false;

  TextEditingController religionfor = new TextEditingController();
  TextEditingController maritialstuts = TextEditingController();
  TextEditingController castefield = TextEditingController();
  TextEditingController subcastefield = TextEditingController();
  TextEditingController countryfield = TextEditingController();
  TextEditingController statefield = TextEditingController();
  TextEditingController cityfield = TextEditingController();
  TextEditingController starfield = TextEditingController();
  TextEditingController zodiacfield = TextEditingController();

  TextEditingController Doshamfield = TextEditingController();

  final MyController con = Get.find();
  // bool status = false;
  String radioButtonItem = 'ONE';
  int id = 1;
  // bool countDownComplete = false;

  var cityList1 = [];
  var cityList = [];
  var stateList = [];
  var countryList = [];
  var country = [];
  var maritialstatus = [];
  var Dosham = [];
  var caste = [];
  var religions = [];
  var zodiac = [];
  var star = [];

  var maritialstatusList = [];
  var casteList = [];
  var religionslist = [];
  var raasiList = [];
  var starList = [];
  var zodiacList = [];

  var DoshamList = [];
  List<String> strs1 = [];
  List<String> strs3 = [];
  List<String> strs4 = [];
  List<String> strs5 = [];
  List<String> strs6 = [];
  List<String> strs7 = [];
  List<String> strs15 = [];
  // List<String> strs20 = [];
  List<String> strs21 = [];
  List<String> strs22 = [];
  List<String> strs23 = [];

  @override
  void initState() {
    getData();
    // getData1();

    // getData2();
    // secureScreen();
    super.initState();
  }

  gradientclr crl = gradientclr();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Color.fromARGB(255, 231, 231, 231),
          // toolbarHeight: 100,
          title: Text(
            "REGISTRATION".tr,
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  LanguageBtn(),
                  Text(
                    " తె",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
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
              Container(
                margin: EdgeInsets.all(10),
                child: Row(children: [
                  Icon(
                    Icons.menu_rounded,
                    color: Colors.green,
                  ),
                  Text(
                    "  Welcome, give us a few details about you.".tr,
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Row(
                  children: [
                    Text(
                      "MARITIAL STATUS".tr,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 8),
                // height: 40,
                margin: EdgeInsets.only(right: 15, left: 15),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: EasyAutocomplete(
                  progressIndicatorBuilder:
                      CircularProgressIndicator(color: Colors.orange),
                  debounceDuration: Duration(microseconds: 0),
                  controller: maritialstuts,
                  decoration:
                      InputDecoration(suffixIcon: Icon(Icons.arrow_drop_down)),
                  // asyncSuggestions: ((searchValue) async {
                  //   return strs3;
                  // }),
                  suggestions: strs3,
                  // onChanged: (value) => print('onChanged value: $value'.tr),
                  onSubmitted: (value) => print('onSubmitted value: $value'.tr),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        "    RELIGION".tr,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    // height: 40,
                    margin: EdgeInsets.only(right: 15, left: 15),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: EasyAutocomplete(
                      progressIndicatorBuilder:
                          CircularProgressIndicator(color: Colors.orange),
                      debounceDuration: Duration(microseconds: 1),
                      controller: religionfor,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.arrow_drop_down)),
                      asyncSuggestions: ((searchValue) async {
                        return strs1;
                      }),
                      // onChanged: (value) {
                      //   print('onSubmitted value: $value');
                      //   getcaste(value);
                      // },
                      onSubmitted: (value) {
                        print('onSubmitted value: $value');
                        getcaste(value);
                      },
                    ),
                  ),
                ]),
              ),
              Container(
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        Text(
                          "CASTE".tr,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    // height: 40,
                    margin: EdgeInsets.only(right: 15, left: 15),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: EasyAutocomplete(
                        progressIndicatorBuilder:
                            CircularProgressIndicator(color: Colors.orange),
                        debounceDuration: Duration(microseconds: 0),
                        controller: castefield,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                        // asyncSuggestions: ((searchValue) async {
                        //   return strs15;
                        // }),
                        suggestions: strs15,
                        // onChanged: (value) =>
                        //     print('onChanged value: $value'.tr),
                        onSubmitted: (value) => {print(value)}),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        Text(
                          "SUB CASTE (Optional)".tr,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    height: 70,
                    child: TextField(
                      controller: subcastefield,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: 'Enter a search term',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(children: [
                      Row(
                        children: [
                          Text(
                            "    Star".tr,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8),

                        // height: 40,
                        margin: EdgeInsets.only(right: 15, left: 15),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: EasyAutocomplete(
                            progressIndicatorBuilder:
                                CircularProgressIndicator(color: Colors.orange),
                            debounceDuration: Duration(microseconds: 1),
                            controller: starfield,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.arrow_drop_down)),
                            // asyncSuggestions: ((searchValue) async {
                            //   return strs6;
                            // }),
                            suggestions: strs6,
                            // onChanged: (value) =>
                            //     print('onChanged value: $value'),
                            onSubmitted: (value) {
                              print('onSubmitted value: $value');
                            }),
                      )
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(children: [
                      Row(
                        children: [
                          Text(
                            "    Zodiac".tr,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        // height: 40,
                        margin: EdgeInsets.only(right: 15, left: 15),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: EasyAutocomplete(
                            progressIndicatorBuilder:
                                CircularProgressIndicator(color: Colors.orange),
                            debounceDuration: Duration(microseconds: 1),
                            controller: zodiacfield,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.arrow_drop_down)),
                            // asyncSuggestions: ((searchValue) async {
                            //   return strs4;
                            // }),
                            suggestions: strs7,
                            // onChanged: (value) =>
                            //     print('onChanged value: $value'),
                            onSubmitted: (value) {
                              print('onSubmitted value: $value');
                            }),
                      )
                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Row(
                      children: [
                        Text(
                          "COUNTRY".tr,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    // height: 40,
                    margin: EdgeInsets.only(right: 15, left: 15),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: EasyAutocomplete(
                        progressIndicatorBuilder:
                            CircularProgressIndicator(color: Colors.orange),
                        debounceDuration: Duration(microseconds: 1),
                        controller: countryfield,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                        // asyncSuggestions: ((searchValue) async {
                        //   return strs21;
                        suggestions: strs21,
                        // }),
                        // onChanged: (value) => print('onChanged value: $value'),
                        onSubmitted: (value) {
                          print('onSubmitted value: $value');
                          getstate(value);
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: Row(
                      children: [
                        Text(
                          "STATE".tr,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    // height: 40,
                    margin: EdgeInsets.only(right: 15, left: 15),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: EasyAutocomplete(
                        progressIndicatorBuilder:
                            CircularProgressIndicator(color: Colors.orange),
                        debounceDuration: Duration(microseconds: 1),
                        controller: statefield,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                        // asyncSuggestions: ((searchValue) async {
                        //   return strs22;
                        // }),
                        suggestions: strs22,
                        // onChanged: (value) => print('onChanged value: $value'),
                        onSubmitted: (value) {
                          print('onSubmitted value: $value');
                          getcity(value);
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: Row(
                      children: [
                        Text(
                          "CITY".tr,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    // height: 40,
                    margin: EdgeInsets.only(right: 15, left: 15),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(12),
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: EasyAutocomplete(
                      progressIndicatorBuilder:
                          CircularProgressIndicator(color: Colors.orange),
                      debounceDuration: Duration(microseconds: 1),
                      controller: cityfield,
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.arrow_drop_down)),
                      // asyncSuggestions: ((searchValue) async {
                      //   return strs23;
                      // }),
                      suggestions: strs23,
                      // onChanged: (value) => print('onChanged value: $value'.tr),
                      onSubmitted: (value) =>
                          print('onSubmitted value: $value'.tr),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: Row(
                      children: [
                        Text(
                          "DOSHAM (Optional)".tr,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 8),
                      // height: 40,
                      margin: EdgeInsets.only(right: 15, left: 15),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: EasyAutocomplete(
                          progressIndicatorBuilder:
                              CircularProgressIndicator(color: Colors.orange),
                          debounceDuration: Duration(microseconds: 1),
                          controller: Doshamfield,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.arrow_drop_down)),
                          // asyncSuggestions: ((searchValue) async {
                          //   return strs5;
                          // }),
                          suggestions: strs5,
                          // onChanged: (value) =>
                          //     print('onChanged value: $value'.tr),
                          onSubmitted: (value) =>
                              print('onSubmitted value: $value'.tr))),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(children: [
                        Text(
                          "Willing to marry from other communities?".tr,
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'No',
                            style: TextStyle(
                              color: Color.fromARGB(255, 175, 175, 175),
                            ),
                          ),
                          Radio(
                            value: 1,
                            groupValue: id,
                            onChanged: (val) {
                              setState(() {
                                // radioButtonItem = 'Yes';
                                id = 1;
                              });
                            },
                          ),
                          Text(
                            'Yes',
                            style: TextStyle(
                              color: Color.fromARGB(255, 175, 175, 175),
                            ),
                          ),
                          Radio(
                            value: 2,
                            groupValue: id,
                            onChanged: (val) {
                              setState(() {
                                // radioButtonItem = 'No';
                                id = 2;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    // Text("communities"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 150,
                height: 40,
                child: ElevatedButton(
                    child: Text(
                      "Continue".tr,
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 255, 111, 0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: Color.fromARGB(255, 255, 111, 0),
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      print(
                        maritialstuts.text,
                      );

                      //execute code

                      print(religionfor.text);
                      print(castefield.text);
                      print(subcastefield.text);
                      print(countryfield.text);
                      print(statefield.text);
                      print(cityfield.text);
                      print(Doshamfield.text);
                      print(
                        id == 1 ? 'NO' : 'Yes',
                      );
                      if (maritialstuts.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'select Maritial Status');
                      } else if (religionfor.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter Religion');
                      } else if (castefield.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter Caste');
                      } else if (zodiacfield.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter Zodiac');
                      } else if (starfield.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter Star');
                      } else if (countryfield.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter Country');
                      } else if (statefield.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter State');
                      } else if (cityfield.text.isEmpty) {
                        Fluttertoast.showToast(msg: 'Enter City');
                      } else if (id.toString() == 'null') {
                        Fluttertoast.showToast(
                            msg: 'Select Other community marriage');

                        // } else if (id.toString() == 'null') {
                        //   Fluttertoast.showToast(msg: 'select Gender');
                      } else {
                        postcastedetail(
                            religionfor.text,
                            castefield.text,
                            subcastefield.text,
                            maritialstuts.text,
                            id == 1 ? 'NO' : 'Yes',
                            Doshamfield.text,
                            countryfield.text,
                            statefield.text,
                            cityfield.text,
                            zodiacfield.text,
                            starfield.text,
                            '');
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => registration2()),
                      // );
                    }),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getcaste(name) async {
    var url = Uri.parse('$baseurl/getCaste');
    final MyController con = Get.find();
    final response = await http.post(url, headers: <String, String>{
      // 'content-type':'application/x-www-form-urlencoded',
      'x_api_key': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
      'religion_id': name,
    });
    var data = json.decode(response.body);
    var casteList1 = data['data']['castelist'];
    setState(() {
      for (var i = 0; i < casteList1.length; i++) {
        print('bbbb' + casteList.toString());
        casteList.add(casteList1[i]['name']);
        // religionslist.add(religions[i]['name']);

      }
    });
    print(response.body.toString());
    strs15 = casteList.map((e) => e.toString()).toList();
  }

  void getstate(name) async {
    var url = Uri.parse('$baseurl/getState');
    final MyController con = Get.find();
    final response = await http.post(url, headers: <String, String>{
      // 'content-type':'application/x-www-form-urlencoded',
      'x_api_key': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
      'country': name,
    });
    var data = json.decode(response.body);
    var stateList1 = data['data']['stateList'];
    setState(() {
      for (var i = 0; i < stateList1.length; i++) {
        print('bbbb' + casteList.toString());
        stateList.add(stateList1[i]['name']);
        // religionslist.add(religions[i]['name']);

      }
    });
    print(response.body.toString());
    strs22 = stateList.map((e) => e.toString()).toList();
  }

  void getcity(name) async {
    var url = Uri.parse('$baseurl/getCity');
    final MyController con = Get.find();
    final response = await http.post(url, headers: <String, String>{
      // 'content-type':'application/x-www-form-urlencoded',
      'x_api_key': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
      'state': name,
    });
    var data = json.decode(response.body);
    var cityList1 = data['data'];
    setState(() {
      for (var i = 0; i < cityList1.length; i++) {
        print('bbbb' + cityList.toString());
        cityList.add(cityList1[i]['name']);
        // religionslist.add(religions[i]['name']);

      }
    });
    print(response.body.toString());
    strs23 = cityList.map((e) => e.toString()).toList();
  }

  Future<void> getData() async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/getRegister";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    final MyController con = Get.find();

    //  print(id);
    var finalurl = Uri.parse(url);
    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
    });

    print(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {
      maritialstatus = decodeValue['data']['marital_status'];
      religions = decodeValue['data']['religions'];

      star = decodeValue['data']['star'];
      zodiac = decodeValue['data']['zodiac'];
      // caste = decodeValue['data'];
      Dosham = decodeValue['data']['dosham'];
      country = decodeValue['data']['country'];

      for (var i = 0; i < maritialstatus.length; i++) {
        maritialstatusList.add(maritialstatus[i]['name'.tr]);
        // religionslist.add(religions[i]['name']);

      }
      for (var i = 0; i < religions.length; i++) {
        religionslist.add(religions[i]['name']);
      }

      for (var i = 0; i < Dosham.length; i++) {
        DoshamList.add(Dosham[i]['name']);
        // religionslist.add(religions[i]['name']);

      }
      for (var i = 0; i < country.length; i++) {
        countryList.add(country[i]['name']);
        // religionslist.add(religions[i]['name']);

      }

      for (var i = 0; i < star.length; i++) {
        starList.add(star[i]['name']);
        // religionslist.add(religions[i]['name']);

      }
      for (var i = 0; i < zodiac.length; i++) {
        zodiacList.add(zodiac[i]['name']);
        // religionslist.add(religions[i]['name']);

      }

      print(maritialstatusList.runtimeType);
      strs1 = religionslist.map((e) => e.toString()).toList();
      strs3 = maritialstatusList.map((e) => e.toString()).toList();

      strs5 = DoshamList.map((e) => e.toString()).toList();
      // strs20 = DoshamList.map((e) => e.toString()).toList();
      strs21 = countryList.map((e) => e.toString()).toList();
      // strs4 = raasiList.map((e) => e.toString()).toList();
      strs6 = starList.map((e) => e.toString()).toList();
      strs7 = zodiacList.map((e) => e.toString()).toList();
      print(strs3.runtimeType);
      print(strs4.runtimeType);
      print(maritialstatusList);
    });
  }

  Future<void> postcastedetail(
      religion,
      caste,
      sub_caste,
      maritial_status,
      marry_other_community,
      dosham,
      country,
      state,
      city,
      zodiac,
      star,
      raasi) async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/saveCasteDetails";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    final MyController con = Get.find();
    SharedPreferences pref = await SharedPreferences.getInstance();
    var regId = pref.getString('temp_id');
    //  print(id);
    var finalurl = Uri.parse(url);
    var body = {
      'reg_id': regId,
      'religion': religion,
      'caste': caste,
      'sub_caste': sub_caste,
      'maritial_status': maritial_status,
      'marry_other_community': marry_other_community,
      'dosham': dosham,
      'country': country,
      'state': state,
      'city': city,
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
      'zodiac': zodiac,
      'star': star,
      'raasi': raasi,
    };
    print(body.toString());
    var res = await http.post(finalurl,
        headers: <String, String>{
          'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
        },
        body: body);

    log('hi' + res.body);
    // var decodeValue = json.decode(res.body);
    // var decodeValue = json.decode(res.body);
    setState(() {});
    // if (decodeValue['status']) {
    //   SharedPreferences pref = await SharedPreferences.getInstance();
    //   pref.setString('temp_id', decodeValue['data']['user_temp_id'].toString());
    Get.to(() => registration2());
  }
}
