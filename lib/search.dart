import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:sujithamatrimony/loginpage.dart';
import 'package:sujithamatrimony/prime.dart';
import 'package:sujithamatrimony/profilescreen.dart';
import 'package:sujithamatrimony/homescreen.dart';
import 'package:sujithamatrimony/search_screen.dart';
import 'package:sujithamatrimony/whatwelookingfor.dart';
import 'bottomsheet.dart';
import 'language_btn.dart';
import 'otppage.dart';
import 'registration2.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:easy_autocomplete/easy_autocomplete.dart';

var baseurl =
    'http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/';

var searchprofile = [];

class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> with SingleTickerProviderStateMixin {
  var usernameController;

  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  TextEditingController minage = TextEditingController();
  TextEditingController maxage = TextEditingController();
  TextEditingController minheight = TextEditingController();
  TextEditingController maxheight = TextEditingController();
  TextEditingController maritialstatus = TextEditingController();
  TextEditingController mothertongue = TextEditingController();
  TextEditingController physicalstatus = TextEditingController();
  TextEditingController eatinghabits = TextEditingController();
  TextEditingController drinkinghabits = TextEditingController();
  TextEditingController smokinghabit = TextEditingController();
  TextEditingController religion = TextEditingController();
  TextEditingController caste = TextEditingController();
  TextEditingController subcastefields = TextEditingController();
  TextEditingController starcontrol = TextEditingController();
  TextEditingController Dosham = TextEditingController();
  TextEditingController Educationfields = TextEditingController();
  TextEditingController Educationcategoryfields = TextEditingController();
  TextEditingController employedin = TextEditingController();
  TextEditingController occupation = TextEditingController();

  TextEditingController occupationfield1 = TextEditingController();
  TextEditingController annualincome = TextEditingController();
  TextEditingController Country = TextEditingController();
  TextEditingController residingState = TextEditingController();
  TextEditingController residingCity = TextEditingController();
  TextEditingController matriid = TextEditingController();

  List<String> strs24 = [];
  List<String> strs25 = [];
  List<String> strs26 = [];
  List<String> strs27 = [];
  List<String> strs28 = [];
  List<String> strs29 = [];
  List<String> strs30 = [];
  List<String> strs31 = [];
  List<String> strs32 = [];
  List<String> strs33 = [];
  List<String> strs34 = [];
  List<String> strs35 = [];
  List<String> strs36 = [];
  List<String> strs37 = [];
  List<String> strs38 = [];
  List<String> strs39 = [];
  List<String> strs40 = [];
  List<String> strs41 = [];
  List<String> strs81 = [];
  List<String> strs8 = [];
  List<String> strs15 = [];
  List<String> strs16 = [];
  List<String> strs17 = [];

  var age = [];
  var ageList = [];
  var height = [];
  var heightlist = [];
  var marital_status = [];
  var maritalstatusList = [];
  var mother_tongue = [];
  var mothertongueList = [];
  var physical_status = [];
  var physical_statusList = [];
  var eating_habits = [];
  var eating_habitsList = [];
  var drinking_habits = [];
  var drinking_habitsList = [];
  var smoking_habits = [];
  var smoking_habitsList = [];
  var religions = [];
  var religionsList = [];
  var employed_in = [];
  var employed_inList = [];
  var occupation_category = [];
  var occupation_categoryList = [];
  var annual_income = [];
  var annual_incomeList = [];
  var dosham = [];
  var doshamList = [];
  var star = [];
  var starList = [];
  var country = [];
  var countryList = [];
  var stateList = [];
  var statelist = [];
  var casteList1 = [];
  var casteList = [];
  var cityList = [];
  var cityList1 = [];
  var educations = [];
  var educationslist = [];
  var educationlistss = [];
  var occupation_categorylistss = [];
  var occupationslistss = [];

  // final _formKey = GlobalKey<FormState>();

  //  TabController tabController;
  @override
  void initState() {
    // tabController = TabController(length: 2, vsync: this);
    super.initState();
    // secureScreen();
    geteducation();
    getoccupation_category();
    getData();
    // confirmragistration();
  }

  @override
  void dispose() {
    super.dispose();
    // tabController!.dispose();
    minage.dispose();
  }

  bool isSwitchOn = false;

  bool status = true;

  // TextEditingController whatareyoulooking = TextEditingController();
  // final MyController con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "".tr,
          style: TextStyle(fontSize: 18, color: Colors.black),
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
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Column(
            //     children: [
            //       Text(
            //         "Matches recommended by us are based on Acceptable matches criteria and at times might go slightly beyond your preferences."
            //             .tr,
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            //       ),
            //       SizedBox(
            //         height: 10,
            //       ),
            //       Text(
            //         "Turn on 'compulsory' to get matches exactly as per your preferences."
            //             .tr,
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 50,
            // ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Search Profile".tr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Matrimony ID".tr,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(right: 15, left: 15),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: matriid,
                  // controller: Idsearch,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z.0-9 ]")),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Matrimony ID'.tr,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                  ),
                  // controller: _con1,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(thickness: 2),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Age".tr,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            if (strs24.length > 0)
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
                  controller: minage,
                  decoration: InputDecoration(
                      hintText: 'Min age'.tr,
                      suffixIcon: Icon(Icons.arrow_drop_down)),
                  asyncSuggestions: ((searchValue) async {
                    return strs24;
                  }),
                  onChanged: (value) => print('onChanged value: $value'.tr),
                  onSubmitted: (value) => print('onSubmitted value: $value'.tr),
                ),
              ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [Text('to')],
            ),
            SizedBox(
              height: 10,
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
                controller: maxage,
                decoration: InputDecoration(
                    hintText: 'Max age'.tr,
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                asyncSuggestions: ((searchValue) async {
                  return strs24;
                }),
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Height".tr,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
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
                controller: minheight,
                decoration: InputDecoration(
                    hintText: 'Min Height'.tr,
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                asyncSuggestions: ((searchValue) async {
                  return strs25;
                }),
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [Text('to')],
            ),
            SizedBox(
              height: 10,
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
                controller: maxheight,
                decoration: InputDecoration(
                    hintText: 'Max Height'.tr,
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                asyncSuggestions: ((searchValue) async {
                  return strs25;
                }),
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Maritial Status".tr,
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
                controller: maritialstatus,
                decoration: InputDecoration(
                    hintText: 'Maritial Status'.tr,
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                asyncSuggestions: ((searchValue) async {
                  return strs26;
                }),
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Mother Tongue".tr,
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
                controller: mothertongue,
                decoration: InputDecoration(
                    hintText: 'Mother Tongue'.tr,
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                asyncSuggestions: ((searchValue) async {
                  return strs27;
                }),
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Physical Status".tr,
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
                controller: physicalstatus,
                decoration: InputDecoration(
                    hintText: 'Physical Status'.tr,
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                asyncSuggestions: ((searchValue) async {
                  return strs28;
                }),
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Text(
                    "Religious Preferences".tr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Religion".tr,
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
                  controller: religion,
                  decoration: InputDecoration(
                      hintText: 'Religion'.tr,
                      suffixIcon: Icon(Icons.arrow_drop_down)),
                  asyncSuggestions: ((searchValue) async {
                    return strs32;
                  }),
                  onChanged: (value) {
                    print('onSubmitted value: $value');
                    getcaste(value);
                  },
                  onSubmitted: (value) {
                    print('onSubmitted value: $value');
                    getcaste(value);
                  }),
            ),

            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Caste".tr,
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
                  controller: caste,
                  decoration: InputDecoration(
                      hintText: 'Caste'.tr,
                      suffixIcon: Icon(Icons.arrow_drop_down)),
                  asyncSuggestions: ((searchValue) async {
                    return strs41;
                  }),
                  onChanged: (value) => print('onChanged value: $value'.tr),
                  // onChanged: (value) => {getcaste(value.toString())},
                  // onChanged: (value) =>
                  //     print('onChanged value: $value'.tr),
                  // onSubmitted: (value) =>
                  //     print('onSubmitted value: $value'.tr),
                  onSubmitted: (value) => {print(value)}),
            ),
            // SizedBox(
            //   height: 20,
            // ),
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
                  controller: Educationfields,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      hintText: 'Education'.tr),
                  asyncSuggestions: ((searchValue) async {
                    return strs8;
                  }),
                  onChanged: (value) {
                    print('onSubmitted value: $value');
                    geteducationlists(value);
                  },
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
                controller: Educationcategoryfields,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    hintText: 'Education Category'.tr),
                asyncSuggestions: ((searchValue) async {
                  return strs15;
                }),
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              padding: EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Text(
                    "Professional Preferences".tr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Employed in".tr,
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
                controller: employedin,
                decoration: InputDecoration(
                    hintText: 'Employed in'.tr,
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                asyncSuggestions: ((searchValue) async {
                  return strs33;
                }),
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
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
                  controller: occupation,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      hintText: 'Occupation Category'.tr),
                  asyncSuggestions: ((searchValue) async {
                    return strs16;
                  }),
                  onChanged: (value) => print('onChanged value: $value'.tr),
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
              padding: EdgeInsets.only(
                left: 8,
              ),
              // height: 40,
              margin: EdgeInsets.only(
                right: 15,
                left: 15,
              ),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: EasyAutocomplete(
                progressIndicatorBuilder:
                    CircularProgressIndicator(color: Colors.orange),
                debounceDuration: Duration(microseconds: 1),
                controller: occupationfield1,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.arrow_drop_down),
                    hintText: 'Occupation'.tr),
                asyncSuggestions: ((searchValue) async {
                  return strs17;
                }),
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Annual Income".tr,
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
                controller: annualincome,
                decoration: InputDecoration(
                    hintText: 'Annual Income'.tr,
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                asyncSuggestions: ((searchValue) async {
                  return strs35;
                }),
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              padding: EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Text(
                    "Location Preferences".tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Country".tr,
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
                  controller: Country,
                  decoration: InputDecoration(
                      hintText: 'Country'.tr,
                      suffixIcon: Icon(Icons.arrow_drop_down)),
                  asyncSuggestions: ((searchValue) async {
                    return strs38;
                  }),
                  // onChanged: (value) {
                  //   print('onSubmitted value: $value');
                  //   getstate(value);
                  // },
                  onSubmitted: (value) {
                    print('onSubmitted value: $value');
                    getstate(value);
                  }),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Residing State".tr,
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
                  controller: residingState,
                  decoration: InputDecoration(
                      hintText: 'Residing State'.tr,
                      suffixIcon: Icon(Icons.arrow_drop_down)),
                  asyncSuggestions: ((searchValue) async {
                    return strs39;
                  }),
                  // onChanged: (value) {
                  //   print('onSubmitted value: $value');
                  //   getcity(value);
                  // },
                  onSubmitted: (value) {
                    print('onSubmitted value: $value');
                    getcity(value);
                  }),
            ),

            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Residing City".tr,
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
                controller: residingCity,
                decoration: InputDecoration(
                    hintText: 'Residing City'.tr,
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                asyncSuggestions: ((searchValue) async {
                  return strs40;
                }),
                //  onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),

            SizedBox(
              height: 50,
            ),
            Container(
              child: ElevatedButton(
                child: Text(
                  "Submit".tr,
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
                  if (matriid.text.isNotEmpty) {
                    searchProfile("", '', '', '', '', '', '', '', '', '', '',
                        '', '', '', '', '', matriid.text);
                  } else if (matriid.text.isEmpty &&
                      (minage.text.isNotEmpty ||
                          maxage.text.isNotEmpty ||
                          minheight.text.isNotEmpty ||
                          maxheight.text.isNotEmpty ||
                          maritialstatus.text.isNotEmpty ||
                          mothertongue.text.isNotEmpty ||
                          physicalstatus.text.isNotEmpty ||
                          religion.text.isNotEmpty ||
                          caste.text.isNotEmpty ||
                          Educationcategoryfields.text.isNotEmpty ||
                          employedin.text.isNotEmpty ||
                          occupationfield1.text.isNotEmpty ||
                          annualincome.text.isNotEmpty ||
                          Country.text.isNotEmpty ||
                          residingState.text.isNotEmpty ||
                          residingCity.text.isNotEmpty ||
                          matriid.text.isNotEmpty)) {
                    searchProfile(
                        minage.text,
                        maxage.text,
                        minheight.text,
                        maxheight.text,
                        maritialstatus.text,
                        mothertongue.text,
                        physicalstatus.text,
                        religion.text,
                        caste.text,
                        Educationcategoryfields.text,
                        employedin.text,
                        occupationfield1.text,
                        annualincome.text,
                        Country.text,
                        residingState.text,
                        residingCity.text,
                        matriid.text);
                  }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => search_screen()),
                  // );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
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
      ' religion_id': name,
    });
    var data = json.decode(response.body);
    var casteList1 = data['data']['castelist'];
    if (this.mounted) {
      setState(() {
        casteList.clear();
        for (var i = 0; i < casteList1.length; i++) {
          print('bbbb' + casteList.toString());
          casteList.add(casteList1[i]['name']);
          // religionslist.add(religions[i]['name']);

        }
      });
    }

    print(response.body.toString());
    strs41 = casteList.map((e) => e.toString()).toList();
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

    var stateList1 = data['data'];
    var stateList2 = [];

    if (stateList1 != null) {
      stateList2 = stateList1['stateList'];
    }
    if (this.mounted) {
      setState(() {
        casteList.clear();
        for (var i = 0; i < stateList2.length; i++) {
          print('bbbb' + casteList.toString());
          stateList.add(stateList2[i]['name']);
          // religionslist.add(religions[i]['name']);

        }
      });
    }

    print(response.body.toString());
    strs39 = stateList.map((e) => e.toString()).toList();
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
    if (this.mounted) {
      setState(() {
        for (var i = 0; i < cityList1.length; i++) {
          print('bbbb' + cityList.toString());
          cityList.add(cityList1[i]['name']);
          // religionslist.add(religions[i]['name']);

        }
      });
    }

    print(response.body.toString());
    strs40 = cityList.map((e) => e.toString()).toList();
  }

  Future<void> searchProfile(
      min_age,
      max_age,
      min_height,
      max_height,
      marital_status,
      mother_tongue,
      physical_status,
      religion,
      caste,
      education,
      employed_in,
      occupation,
      annual_income,
      country,
      state,
      city,
      login_id) async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/searchProfile";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    final MyController con = Get.find();
    SharedPreferences pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');
    //  print(id);
    var finalurl = Uri.parse(url);
    var body = {
      'min_age': min_age,
      'max_age': max_age,
      'min_height': min_height,
      'max_height': max_height,
      'maritial_status': marital_status,
      'mother_tongue': mother_tongue,
      'physical_status': physical_status,
      'religion': religion,
      'caste': caste,
      'education': education,
      'employed_in': employed_in,
      'occupation': occupation,
      'annual_income': annual_income,
      'country': country,
      'state': state,
      'city': city,
      'reg_id': regId,
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
      'login_id': login_id,
    };
    // con.lancode.value == 'en' ? 'en' : 'tu',
    print(body.toString());
    var res = await http.post(finalurl,
        headers: <String, String>{
          'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
        },
        body: body);

    print('hi' + res.body);
    // var decodeValue = json.decode(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {});
    if (decodeValue['status']) {
      if (this.mounted) {
        setState(() {
          searchprofile = decodeValue['data'];
        });
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => search_screen()),
      );
    }
  }

  Future<void> getData() async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/getPartnerPrefrence";
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
    if (this.mounted) {
      setState(() {
        age = decodeValue['data']['age'];
        height = decodeValue['data']['height'];

        marital_status = decodeValue['data']['marital_status'];

        mother_tongue = decodeValue['data']['mother_tongue'];
        physical_status = decodeValue['data']['physical_status'];
        eating_habits = decodeValue['data']['eating_habits'];

        drinking_habits = decodeValue['data']['drinking_habits'];
        smoking_habits = decodeValue['data']['smoking_habits'];
        // caste = decodeValue['data'];
        religions = decodeValue['data']['religions'];
        employed_in = decodeValue['data']['employed_in'];
        occupation_category = decodeValue['data']['occupation_category'];
        annual_income = decodeValue['data']['annual_income'];
        dosham = decodeValue['data']['dosham'];

        star = decodeValue['data']['star'];
        country = decodeValue['data']['country'];

        for (var i = 0; i < age.length; i++) {
          ageList.add(age[i]['value'.tr]);
        }
        for (var i = 0; i < height.length; i++) {
          heightlist.add(height[i]['value']);
        }

        for (var i = 0; i < marital_status.length; i++) {
          maritalstatusList.add(marital_status[i]['name']);
        }
        for (var i = 0; i < mother_tongue.length; i++) {
          mothertongueList.add(mother_tongue[i]['name']);
        }
        for (var i = 0; i < physical_status.length; i++) {
          physical_statusList.add(physical_status[i]['name']);
        }
        for (var i = 0; i < eating_habits.length; i++) {
          eating_habitsList.add(eating_habits[i]['name']);
        }
        for (var i = 0; i < drinking_habits.length; i++) {
          drinking_habitsList.add(drinking_habits[i]['name']);
        }
        for (var i = 0; i < smoking_habits.length; i++) {
          smoking_habitsList.add(smoking_habits[i]['name']);
        }
        for (var i = 0; i < religions.length; i++) {
          religionsList.add(religions[i]['name']);
        }
        for (var i = 0; i < employed_in.length; i++) {
          employed_inList.add(employed_in[i]['name']);
        }
        for (var i = 0; i < occupation_category.length; i++) {
          occupation_categoryList.add(occupation_category[i]['name']);
        }
        for (var i = 0; i < annual_income.length; i++) {
          annual_incomeList.add(annual_income[i]['salary_range']);
        }
        for (var i = 0; i < dosham.length; i++) {
          doshamList.add(dosham[i]['name']);
        }
        for (var i = 0; i < star.length; i++) {
          starList.add(star[i]['name']);
        }
        for (var i = 0; i < country.length; i++) {
          countryList.add(country[i]['name']);
        }

        strs24 = ageList.map((e) => e.toString()).toList();
        strs25 = heightlist.map((e) => e.toString()).toList();
        strs26 = maritalstatusList.map((e) => e.toString()).toList();
        strs27 = mothertongueList.map((e) => e.toString()).toList();
        strs28 = physical_statusList.map((e) => e.toString()).toList();
        strs29 = eating_habitsList.map((e) => e.toString()).toList();
        strs30 = drinking_habitsList.map((e) => e.toString()).toList();
        strs31 = smoking_habitsList.map((e) => e.toString()).toList();
        strs32 = religionsList.map((e) => e.toString()).toList();
        strs33 = employed_inList.map((e) => e.toString()).toList();
        strs34 = occupation_categoryList.map((e) => e.toString()).toList();
        strs35 = annual_incomeList.map((e) => e.toString()).toList();
        strs36 = doshamList.map((e) => e.toString()).toList();
        strs37 = starList.map((e) => e.toString()).toList();
        strs38 = countryList.map((e) => e.toString()).toList();
      });
    }
  }

  void geteducation() async {
    var url = Uri.parse('$baseurl/getRegister');
    final MyController con = Get.find();
    final response = await http.post(url, headers: <String, String>{
      // 'content-type':'application/x-www-form-urlencoded',
      'x_api_key': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
    });
    var data = json.decode(response.body);
    var educations = data['data']['education_category'];
    if (this.mounted) {
      setState(() {
        for (var i = 0; i < educations.length; i++) {
          print('bbbb' + educationslist.toString());
          educationslist.add(educations[i]['name']);
          // religionslist.add(religions[i]['name']);

        }
      });
    }

    print(response.body.toString());
    strs8 = educationslist.map((e) => e.toString()).toList();
  }

  void geteducationlists(name) async {
    var url = Uri.parse('$baseurl/getEducation');
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
    if (this.mounted) {
      setState(() {
        for (var i = 0; i < educationlist.length; i++) {
          print('bbbb' + educationlistss.toString());
          educationlistss.add(educationlist[i]['name']);
          // religionslist.add(religions[i]['name']);

        }
      });
    }

    print(response.body.toString());
    strs15 = educationlistss.map((e) => e.toString()).toList();
  }

  void getoccupation_category() async {
    var url = Uri.parse('$baseurl/getRegister');
    final MyController con = Get.find();
    final response = await http.post(url, headers: <String, String>{
      // 'content-type':'application/x-www-form-urlencoded',
      'x_api_key': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
    });
    var data = json.decode(response.body);
    occupation_category = data['data']['occupation_category'];
    if (this.mounted) {
      setState(() {
        for (var i = 0; i < occupation_category.length; i++) {
          print('bbbb' + occupation_categorylistss.toString());
          occupation_categorylistss.add(occupation_category[i]['name']);
          // religionslist.add(religions[i]['name']);

        }
      });
    }

    print(response.body.toString());
    strs16 = occupation_categorylistss.map((e) => e.toString()).toList();
  }

  void getOccupations(name) async {
    var url = Uri.parse('$baseurl/getOccupations');
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
    if (this.mounted) {
      setState(() {
        for (var i = 0; i < occupations.length; i++) {
          print('bbbb' + occupationslistss.toString());
          occupationslistss.add(occupations[i]['name']);
          // religionslist.add(religions[i]['name']);

        }
      });
    }

    print(response.body.toString());
    strs17 = occupationslistss.map((e) => e.toString()).toList();
  }
}
