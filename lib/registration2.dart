import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sujithamatrimony/bottomsheet.dart';
import 'package:sujithamatrimony/colors.dart';
import 'package:sujithamatrimony/loginpage.dart';
import 'package:get/get.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:sujithamatrimony/photo_upload.dart';
import 'package:sujithamatrimony/preferencelist.dart';
import 'language_btn.dart';
import 'main.dart';
import 'otppage.dart';
import 'registration2.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';


var otpvalue = '';
var resendval = true;

// void registrationapi(
//   customer_mobile,
//   customer_email,
// ) async {
//   final uri = Uri.parse(baseurl + '/registration');
//   var request = http.MultipartRequest('POST', uri);

//   request.headers.addAll({
//     "Content-type": "application/x-www-form-urlencoded",
//     'x-api-key': 'd1c11b10599e380607c42297b8184eb2'
//   });

//   request.fields['customer_mobile'] = mobileController.text.toString();
//   request.fields['customer_email'] = emailController.text.toString();

//   var response = await request.send();
//   final respStr = await response.stream.bytesToString();
//   var data = json.decode(respStr);
//   print(data.toString());
//   if (data['status'] == true) {
//     Get.to(() => createaccotppage(
//           otp: data['data']['OTP'].toString(),
//         ));
//     Fluttertoast.showToast(msg: data['data']['OTP'].toString());
//   } else {
//     Fluttertoast.showToast(msg: data['message']);
//   }
//   print('response' + data.toString());
// }

// TextEditingController Heightfield = TextEditingController();
TextEditingController Familyvaluesfield = TextEditingController();
TextEditingController familystatusfield = TextEditingController();
TextEditingController Annualincomefield = TextEditingController();
TextEditingController occupationfield = TextEditingController();
TextEditingController employedfield = TextEditingController();
TextEditingController Educationfield = TextEditingController();
TextEditingController Physicalstatusfield = TextEditingController();
TextEditingController Heightfield = TextEditingController();
TextEditingController aboutmyselfcontroller = TextEditingController();
TextEditingController ancestralcontroller = TextEditingController();
TextEditingController Educationcategoryfield = TextEditingController();
TextEditingController occupationcategoryfield = TextEditingController();

class registration2 extends StatefulWidget {
  const registration2({Key? key}) : super(key: key);

  @override
  State<registration2> createState() => _registration2State();
}

class _registration2State extends State<registration2> {
  bool status = true;
  bool isSwitchOn = false;

  // TextEditingController namefield = TextEditingController();
  // TextEditingController passwordfield = TextEditingController();
  final MyController con = Get.find();
  // bool status = false;
  String radioButtonItem = 'ONE';
  int id = 1;

  var _clicked = false;

  var familyvaluelist = [];
  var familyvalue = [];
  var employedin = [];
  var employedinlist = [];
  var height = [];
  var heightlist = [];
  var physicalstatus = [];
  var physicalstatuslist = [];
  var educations = [];
  var educationlistss = [];
  var educationslist = [];
  var occupationcategory = [];
  var occupationcategorylist = [];
  var annualincome = [];
  var annualincomelist = [];
  var familystatus = [];
  var familystatuslist = [];
  var occupation_category = [];
  var occupation_categorylistss = [];
  var occupationslistss = [];

  List<String> strs6 = [];
  List<String> strs7 = [];
  List<String> strs8 = [];
  List<String> strs9 = [];
  List<String> strs10 = [];
  List<String> strs11 = [];
  List<String> strs12 = [];
  List<String> strs13 = [];
  List<String> strs14 = [];
  List<String> strs15 = [];
  List<String> strs16 = [];
  List<String> strs17 = [];

  @override
  void initState() {
    getData();
    geteducation();
    getoccupation_category();
    super.initState();
  }

  gradientclr crl = gradientclr();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "REGISTRATION".tr,
            style: TextStyle(fontSize: 18),
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
                    Icons.done_all,
                    color: Colors.green,
                  ),
                  Text(
                    "  Just a few more details and you are good to go".tr,
                  )
                ]),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Row(
                  children: [
                    Text(
                      "HEIGHT".tr,
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
                  controller: Heightfield,
                  decoration:
                      InputDecoration(suffixIcon: Icon(Icons.arrow_drop_down)),
                  // asyncSuggestions: ((searchValue) async {
                  //   return strs6;
                  // }),
                  suggestions: strs6,
                  // onChanged: (value) => print('onChanged value: $value'.tr),
                  onSubmitted: (value) => print('onSubmitted value: $value'.tr),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Text(
                            "PHYSICAL STATUS".tr,
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
                        controller: Physicalstatusfield,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                        // asyncSuggestions: ((searchValue) async {
                        //   return strs7;
                        // }),
                        suggestions: strs7,
                        // onChanged: (value) =>
                        //     print('onChanged value: $value'.tr),
                        onSubmitted: (value) =>
                            print('onSubmitted value: $value'.tr),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Text(
                            "EDUCATION".tr,
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
                          controller: Educationfield,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.arrow_drop_down)),
                          // asyncSuggestions: ((searchValue) async {
                          //   return strs8;
                          // }),
                          suggestions: strs8,
                          // onChanged: (value) =>
                          //     print('onChanged value: $value'.tr),
                          onSubmitted: (value) {
                            print('onSubmitted value: $value');
                            geteducationlists(value);
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Text(
                            "EDUCATION CATEGORY".tr,
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
                        controller: Educationcategoryfield,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                        // asyncSuggestions: ((searchValue) async {
                        //   return strs15;
                        // }),
                        suggestions: strs15,
                        // onChanged: (value) =>
                        //     print('onChanged value: $value'.tr),
                        onSubmitted: (value) =>
                            print('onSubmitted value: $value'.tr),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Text(
                            "EMPLOYED IN ".tr,
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
                        controller: employedfield,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                        // asyncSuggestions: ((searchValue) async {
                        //   return strs13;
                        // }),
                        suggestions: strs13,
                        // onChanged: (value) =>
                        //     print('onChanged value: $value'.tr),
                        onSubmitted: (value) =>
                            print('onSubmitted value: $value'.tr),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Text(
                            "OCCUPATION CATEGORY".tr,
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
                          controller: occupationcategoryfield,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.arrow_drop_down)),
                          // asyncSuggestions: ((searchValue) async {
                          //   return strs16;
                          // }),
                          suggestions: strs16,
                          // onChanged: (value) =>
                          //     print('onChanged value: $value'.tr),
                          onSubmitted: (value) {
                            print('onSubmitted value: $value');
                            getOccupations(value);
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          Text(
                            "OCCUPATION".tr,
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
                        controller: occupationfield,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                        // asyncSuggestions: ((searchValue) async {
                        //   return strs17;
                        // }),
                        suggestions: strs17,
                        // onChanged: (value) =>
                        //     print('onChanged value: $value'.tr),
                        onSubmitted: (value) =>
                            print('onSubmitted value: $value'.tr),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            children: [
                              Text(
                                "ANNUAL INCOME".tr,
                              )
                            ],
                          ),
                        ),
                      ],
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
                        controller: Annualincomefield,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.arrow_drop_down)),
                        // asyncSuggestions: ((searchValue) async {
                        //   return strs11;
                        // }),
                        suggestions: strs11,
                        // onChanged: (value) =>
                        //     print('onChanged value: $value'.tr),
                        onSubmitted: (value) =>
                            print('onSubmitted value: $value'.tr),
                      ),
                    ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: [
                    Text(
                      "FAMILY STATUS".tr,
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
                  controller: familystatusfield,
                  decoration:
                      InputDecoration(suffixIcon: Icon(Icons.arrow_drop_down)),
                  // asyncSuggestions: ((searchValue) async {
                  //   return strs12;
                  // }),
                  suggestions: strs12,
                  // onChanged: (value) => print('onChanged value: $value'.tr),
                  onSubmitted: (value) => print('onSubmitted value: $value'.tr),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: [
                    Text(
                      "FAMILY TYPE".tr,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 45,
                      // width: 155,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: Row(children: [
                        GestureDetector(
                          onTap: (() {}),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Nuclear'.tr,
                              style: TextStyle(
                                color: Color.fromARGB(255, 175, 175, 175),
                              ),
                            ),
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
                      ]),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 15),
                      height: 45,
                      // width: 155,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(border: Border.all(width: 1)),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Joint'.tr,
                            style: TextStyle(
                              color: Color.fromARGB(255, 175, 175, 175),
                            ),
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
                      ]),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: [
                    Text(
                      "FAMILY VALUES".tr,
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
                  controller: Familyvaluesfield,
                  decoration:
                      InputDecoration(suffixIcon: Icon(Icons.arrow_drop_down)),
                  // asyncSuggestions: ((searchValue) async {
                  //   return strs14;
                  // }),
                  suggestions: strs14,
                  // onChanged: (value) => print('onChanged value: $value'.tr),
                  onSubmitted: (value) => print('onSubmitted value: $value'.tr),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: [
                    Text(
                      "ANCESTRAL ORGIN".tr,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: ancestralcontroller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                    // hintText: 'Enter a search term',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: [
                    Text(
                      "ABOUT MY SELF".tr,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                // padding: EdgeInsets.all(10),
                child: TextField(
                  controller: aboutmyselfcontroller,
                  maxLines: 7,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                    // hintText: 'Enter a search term',
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 250,
                height: 40,
                child: ElevatedButton(
                  child: Text(
                    "Complete Registration".tr,
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const otppage()),
                    // );
                    print(Heightfield.text);
                    print(Physicalstatusfield.text);
                    print(Educationfield.text);
                    print(occupationfield.text);
                    print(employedfield.text);

                    print(Annualincomefield.text);
                    print(familystatusfield.text);

                    print(id == 1 ? 'Nuclear' : 'joint');

                    print(Familyvaluesfield.text);
                    print(ancestralcontroller.text);
                    print(aboutmyselfcontroller.text);

                    if (Heightfield.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'select Height');
                    } else if (Physicalstatusfield.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Enter Physical Status');
                    } else if (Educationfield.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'select Education');
                    } else if (occupationfield.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'select occupation');
                    } else if (employedfield.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'select Employed IN');
                    } else if (Annualincomefield.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'select Annual Income');
                    } else if (familystatusfield.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'select Family Status');
                    } else if (Familyvaluesfield.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'family Value');
                    } else if (ancestralcontroller.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: 'select enter Ancestral Orgin');
                    } else if (aboutmyselfcontroller.toString() == 'null') {
                      Fluttertoast.showToast(msg: 'select About my Self');
                    } else {
                      if (_clicked == false) {
                        _clicked = true;
                        saveEducationDetails(
                            Heightfield.text,
                            Physicalstatusfield.text,
                            Educationfield.text,
                            occupationfield.text,
                            employedfield.text,
                            Annualincomefield.text,
                            familystatusfield.text,
                            id == 1 ? 'Nuclear' : 'joint',
                            Familyvaluesfield.text,
                            ancestralcontroller.text,
                            aboutmyselfcontroller.text);
                      }
                    }
                    // };
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => otppage()),
                    // );
                    // Future.delayed(const Duration(seconds: 15));
                  },
                ),
              ),
              // TextButton(
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => photo_upload()),
              //       );
              //     },
              //     child: Column(children: [
              //       Text(
              //         "Skip".tr,
              //         style: TextStyle(
              //             color: Color.fromARGB(255, 255, 111, 0),
              //             fontSize: 20),
              //       )
              //     ])),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    var url = baselink + "getRegister";
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

    print('hi' + res.body);
    // var decodeValue = json.decode(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {
      height = decodeValue['data']['height'];
      physicalstatus = decodeValue['data']['physical_status'];
      educations = decodeValue['data']['education_category'];
      occupationcategory = decodeValue['data']['occupation_category'];
      annualincome = decodeValue['data']['annual_income'];
      employedin = decodeValue['data']['employed_in'];

      familystatus = decodeValue['data']['family_status'];
      familyvalue = decodeValue['data']['family_value'];

      for (var i = 0; i < height.length; i++) {
        heightlist.add(height[i]['value']);
        // religionslist.add(religions[i]['name']);

      }

      for (var i = 0; i < physicalstatus.length; i++) {
        physicalstatuslist.add(physicalstatus[i]['name']);
        // religionslist.add(religions[i]['name']);

      }

      for (var i = 0; i < annualincome.length; i++) {
        annualincomelist.add(annualincome[i]['salary_range']);
        // religionslist.add(religions[i]['name']);

      }
      for (var i = 0; i < familystatus.length; i++) {
        familystatuslist.add(familystatus[i]['name']);
        // religionslist.add(religions[i]['name']);

      }
      for (var i = 0; i < employedin.length; i++) {
        employedinlist.add(employedin[i]['name']);
        // religionslist.add(religions[i]['name']);

      }
      for (var i = 0; i < familyvalue.length; i++) {
        familyvaluelist.add(familyvalue[i]['name']);
        // religionslist.add(religions[i]['name']);

      }

      // print('ssss' + religions.toString());

      print(heightlist.runtimeType);
      strs6 = heightlist.map((e) => e.toString()).toList();

      strs7 = physicalstatuslist.map((e) => e.toString()).toList();

      strs10 = occupationcategorylist.map((e) => e.toString()).toList();

      strs11 = annualincomelist.map((e) => e.toString()).toList();
      strs12 = familystatuslist.map((e) => e.toString()).toList();
      strs13 = employedinlist.map((e) => e.toString()).toList();
      strs14 = familyvaluelist.map((e) => e.toString()).toList();
      print(strs6.runtimeType);
      print(strs7.runtimeType);

      // ad_banner=decodeValue['data']['main_banner'];

      print(heightlist);
      print(physicalstatuslist);
    });
  }

  void geteducation() async {
    var url = Uri.parse(baselink + 'getRegister');
    final MyController con = Get.find();
    final response = await http.post(url, headers: <String, String>{
      // 'content-type':'application/x-www-form-urlencoded',
      'x_api_key': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
    });
    var data = json.decode(response.body);
    var educations = data['data']['education_category'];
    setState(() {
      for (var i = 0; i < educations.length; i++) {
        print('bbbb' + educationslist.toString());
        educationslist.add(educations[i]['name']);
        // religionslist.add(religions[i]['name']);

      }
    });
    print(response.body.toString());
    strs8 = educationslist.map((e) => e.toString()).toList();
  }

  void geteducationlists(name) async {
    var url = Uri.parse(baselink + 'getEducation');
    final MyController con = Get.find();
    final response = await http.post(url, headers: <String, String>{
      // 'content-type':'application/x-www-form-urlencoded',
      'x_api_key': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      'edu_cat_id': name,
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
    });
    var data = json.decode(response.body);
    var educationlist = data['data'];
    setState(() {
      for (var i = 0; i < educationlist.length; i++) {
        print('bbbb' + educationlistss.toString());
        educationlistss.add(educationlist[i]['name']);
        // religionslist.add(religions[i]['name']);

      }
    });
    print(response.body.toString());
    strs15 = educationlistss.map((e) => e.toString()).toList();
  }

  void getoccupation_category() async {
    var url = Uri.parse(baselink + 'getRegister');
    final MyController con = Get.find();
    final response = await http.post(url, headers: <String, String>{
      // 'content-type':'application/x-www-form-urlencoded',
      'x_api_key': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
    });
    var data = json.decode(response.body);
    occupation_category = data['data']['occupation_category'];

    setState(() {
      for (var i = 0; i < occupation_category.length; i++) {
        print('bbbb' + occupation_categorylistss.toString());
        occupation_categorylistss.add(occupation_category[i]['name']);
        // religionslist.add(religions[i]['name']);

      }
    });
    print(response.body.toString());
    strs16 = occupation_categorylistss.map((e) => e.toString()).toList();
  }

  void getOccupations(name) async {
    var url = Uri.parse(baselink + 'getOccupations');
    final MyController con = Get.find();
    final response = await http.post(url, headers: <String, String>{
      // 'content-type':'application/x-www-form-urlencoded',
      'x_api_key': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      'occupation_cat_id': name,
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
    });
    var data = json.decode(response.body);
    var occupations = data['data'];
    setState(() {
      for (var i = 0; i < occupations.length; i++) {
        print('bbbb' + occupationslistss.toString());
        occupationslistss.add(occupations[i]['name']);
        // religionslist.add(religions[i]['name']);

      }
    });
    print(response.body.toString());
    strs17 = occupationslistss.map((e) => e.toString()).toList();
  }

  Future<void> saveEducationDetails(
    height,
    physical_status,
    education,
    occupation,
    employed_in,
    annual_income,
    family_status,
    family_type,
    family_values,
    ancestral_orgin,
    about_me,
  ) async {
    var url = baselink + "saveEducationDetails";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    final MyController con = Get.find();
    SharedPreferences pref = await SharedPreferences.getInstance();
    var regId = pref.getString('temp_id');
    //  print(id);
    var finalurl = Uri.parse(url);
    var body = {
      'reg_id': regId,
      'height': height,
      'physical_status': physical_status,
      'education': 'B.tech',
      'occupation': 'Horticulturist',
      'employed_in': employed_in,
      'annual_income': annual_income,
      'family_status': family_status,
      'family_type': family_type,
      'family_values': family_values,
      'ancestral_orgin': ancestral_orgin,
      'about_me': about_me,
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
    };
    print(body.toString());
    var res = await http.post(finalurl,
        headers: <String, String>{
          'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
        },
        body: body);

    log('hi' + res.body);
    // var decodeValue = json.decode(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {});
    Fluttertoast.showToast(
      msg: decodeValue['data']['OTP'].toString(),
    );
    // if (decodeValue['status']) {
    //   SharedPreferences pref = await SharedPreferences.getInstance();
    //   pref.setString('temp_id', decodeValue['data']['user_temp_id'].toString());
    _clicked = false;
    Get.to(() => otppage(
          otp: decodeValue['data']['OTP'].toString(),
        ));
  }
}
