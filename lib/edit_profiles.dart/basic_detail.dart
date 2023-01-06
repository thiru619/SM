import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
import 'package:sujithamatrimony/whatwelookingfor.dart';
// import 'bottomsheet.dart';
// import 'language_btn.dart';
// import 'otppage.dart';
// import 'registration2.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:easy_autocomplete/easy_autocomplete.dart';

import '../bottomsheet.dart';
import '../language_btn.dart';
import '../main.dart';
import 'edit_profile.dart';



TextEditingController name = TextEditingController();
TextEditingController age = TextEditingController();
TextEditingController height_data = TextEditingController();
TextEditingController height = TextEditingController();
TextEditingController weight_data = TextEditingController();
TextEditingController weight = TextEditingController();
TextEditingController marital_data = TextEditingController();
TextEditingController marital = TextEditingController();
TextEditingController drinkinghabits = TextEditingController();
TextEditingController smokinghabit = TextEditingController();
// TextEditingController drinkinghabit = TextEditingController();
TextEditingController mothertongue = TextEditingController();
TextEditingController physicalstatus = TextEditingController();
// TextEditingController bodytype = TextEditingController();
TextEditingController eatinghabit = TextEditingController();
TextEditingController profile_created_by = TextEditingController();
TextEditingController body_type = TextEditingController();

List<String> strs1 = [];
List<String> strs2 = [];
List<String> strs3 = [];
List<String> strs4 = [];
List<String> strs5 = [];
List<String> strs6 = [];
List<String> strs7 = [];
List<String> strs8 = [];
List<String> strs9 = [];
List<String> strs10 = [];

class basic_detail extends StatefulWidget {
  const basic_detail({Key? key}) : super(key: key);

  @override
  State<basic_detail> createState() => _basic_detailState();
}

class _basic_detailState extends State<basic_detail>
    with SingleTickerProviderStateMixin {
  var usernameController;

  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  var height_data = [];
  var heightlist = [];
  var weight_data = [];
  var weight_dataList = [];
  var marital_data = [];
  var marital_datalist = [];
  var drinking_habit_data = [];
  var drinking_habit_datalist = [];
  var eating_habit_data = [];
  var eating_habit_datalist = [];
  var smoking_habit_data = [];
  var smoking_habit_datalist = [];
  var physical_data = [];
  var physical_datalist = [];
  var mother_tongue_data = [];
  var mother_tongue_datalist = [];
  var weight_datalist = [];
  var marital_dataList = [];
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
  var profileCreatedFor = [];
  var profileCreatedForlist = [];
  var body_type_data = [];
  var body_type_datalist = [];

  // String? selectedValue1;
  // String? selectedValue2;
  // String? selectedValue3;
  // String? selectedValue4;
  // String? selectedValue5;
  // String? selectedValue6;
  // String? selectedValue7;
  // String? selectedValue8;
  // String? selectedValue9;
  // String? selectedValue10;
  // String? selectedValue11;
  // String? selectedValue12;
  // String? selectedValue13;
  // String? selectedValue14;
  // String? selectedValue15;
  // String? selectedValue16;
  // String? selectedValue17;
  // String? selectedValue18;
  // String? selectedValue19;
  // String? selectedValue20;
  // String? selectedValue21;
  // String? selectedValue22;

  final _formKey = GlobalKey<FormState>();
  TabController? tabController;
  //  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    // secureScreen();
    // geteducation();
    getData();
    // confirmragistration();
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  bool isSwitchOn = false;

  bool status = true;

  // TextEditingController whatareyoulooking = TextEditingController();
  final MyController con = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
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
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Basic Details".tr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
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
                    "Name".tr,
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
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Text(
                    "Age".tr,
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
              child: TextFormField(
                controller: age,
                decoration: InputDecoration(
                  hintText: 'age',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Text(
                    "Height".tr,
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
                controller: height,
                decoration: InputDecoration(
                    hintText: 'Height',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                suggestions: strs1,
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 0),
              child: Row(
                children: [
                  Text(
                    "Weight".tr,
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
                controller: weight,
                decoration: InputDecoration(
                    hintText: 'Weight',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                suggestions: strs2,
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Marital Status".tr,
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
                controller: marital,
                decoration: InputDecoration(
                    hintText: 'Marital Status',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                suggestions: strs3,
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
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
                controller: mothertongue,
                decoration: InputDecoration(
                    hintText: 'Mother Tongue',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                suggestions: strs8,
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
                controller: physicalstatus,
                decoration: InputDecoration(
                    hintText: 'Physical Status',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                suggestions: strs7,
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Body Type".tr,
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
                controller: body_type,
                decoration: InputDecoration(
                    hintText: 'Body Type',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                suggestions: strs10,
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Profile Created for".tr,
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
                  controller: profile_created_by,
                  decoration: InputDecoration(
                      hintText: 'Profile Created for',
                      suffixIcon: Icon(Icons.arrow_drop_down)),
                  suggestions: strs9,
                  onChanged: (value) => print('onChanged value: $value'),
                  onSubmitted: (value) {
                    print('onSubmitted value: $value');
                    // getcaste(value);
                  }),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Eating Habit".tr,
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
                  controller: eatinghabit,
                  decoration: InputDecoration(
                      hintText: 'Eating Habit',
                      suffixIcon: Icon(Icons.arrow_drop_down)),
                  suggestions: strs5,
                  onChanged: (value) => print('onChanged value: $value'.tr),
                  // onChanged: (value) => {getcaste(value.toString())},
                  // onChanged: (value) =>
                  //     print('onChanged value: $value'.tr),
                  // onSubmitted: (value) =>
                  //     print('onSubmitted value: $value'.tr),
                  onSubmitted: (value) => {print(value)}),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Drinking Habit".tr,
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
                controller: drinkinghabits,
                decoration: InputDecoration(
                    hintText: 'Drinking Habit',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                suggestions: strs4,
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Smoking Habit".tr,
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
                controller: smokinghabit,
                decoration: InputDecoration(
                    hintText: 'Smoking Habit',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                suggestions: strs6,
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            SizedBox(
              height: 20,
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
                  // if (profile_created_by.text.isEmpty) {
                  //   Fluttertoast.showToast(msg: 'select Profile Created for');
                  // } else if (name.text.isEmpty) {
                  //   Fluttertoast.showToast(msg: 'Enter Name');
                  // } else if (age.text.isEmpty) {
                  //   Fluttertoast.showToast(msg: 'Enter Age');
                  // } else if (height.text.isEmpty) {
                  //   Fluttertoast.showToast(msg: 'Enter Height');
                  // } else if (weight.text.isEmpty) {
                  //   Fluttertoast.showToast(msg: 'Enter Weight');
                  // } else if (marital.text.isEmpty) {
                  //   Fluttertoast.showToast(msg: 'Enter MaritalStatus');
                  // } else if (body_type.text.isEmpty) {
                  //   Fluttertoast.showToast(msg: 'Enter Body Type');
                  // } else if (mothertongue.text.isEmpty) {
                  //   Fluttertoast.showToast(msg: 'Enter Mother Tongue');
                  // } else if (eatinghabit.text.isEmpty) {
                  //   Fluttertoast.showToast(msg: 'Enter Eating Habit');
                  // } else if (drinkinghabits.text.isEmpty) {
                  //   Fluttertoast.showToast(msg: 'Enter Drinking habit');
                  // } else if (smokinghabit.text.isEmpty) {
                  //   Fluttertoast.showToast(msg: 'Enter Smoking Habit');
                  // } else {

                  saveBasicDetails(
                    profile_created_by.text,
                    name.text,
                    age.text,
                    height.text,
                    weight.text,
                    marital.text,
                    body_type.text,
                    mothertongue.text,
                    eatinghabit.text,
                    drinkinghabits.text,
                    smokinghabit.text,
                  );
                  // }
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

  Future<void> getData() async {
    var url =
         baselink +"editBasicProfile";
    // checker(context) async {
    var pref = await SharedPreferences.getInstance();
    var regid = pref.getString('regsId');
    final MyController con = Get.find();

    //  print(id);
    var finalurl = Uri.parse(url);
    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      // 'language': con.lancode.value == 'en' ? 'en' : 'tu',
      'reg_id': regid,
    });

    print(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {
      // profileCreatedFor = decodeValue['data']['profileCreatedFor'];
      name.text = decodeValue['data']['name'];
      age.text = decodeValue['data']['dob'];
      height.text = decodeValue['data']['height'];
      weight.text = decodeValue['data']['weight'];

      marital.text = decodeValue['data']['maritial_status'];
      mothertongue.text = decodeValue['data']['mother_tongue'];
      physicalstatus.text = decodeValue['data']['physical_status'];
      eatinghabit.text = decodeValue['data']['eating_habits'];
      drinkinghabits.text = decodeValue['data']['drinking_habits'];
      smokinghabit.text = decodeValue['data']['smoking_habits'];
      profile_created_by.text = decodeValue['data']['profile_created_by'];
      body_type.text = decodeValue['data']['body_type'];

      // dob = decodeValue['data']['1998-10-31'];

      height_data = decodeValue['data']['height_data'];
      weight_data = decodeValue['data']['weight_data'];
      marital_data = decodeValue['data']['marital_data'];
      drinking_habit_data = decodeValue['data']['drinking_habit_data'];
      eating_habit_data = decodeValue['data']['eating_habit_data'];
      smoking_habit_data = decodeValue['data']['smoking_habit_data'];
      physical_data = decodeValue['data']['physical_data'];
      mother_tongue_data = decodeValue['data']['mother_tongue_data'];
      profileCreatedFor = decodeValue['data']['profileCreatedFor'];
      body_type_data = decodeValue['data']['body_type_data'];

      // for (var i = 0; i < age.length; i++) {
      //   ageList.add(age[i]['value'.tr]);
      // }
      for (var i = 0; i < height_data.length; i++) {
        heightlist.add(height_data[i]['value']);
      }
      for (var i = 0; i < weight_data.length; i++) {
        weight_datalist.add(weight_data[i]['weight']);
      }
      for (var i = 0; i < marital_data.length; i++) {
        marital_datalist.add(marital_data[i]['name']);
      }
      for (var i = 0; i < drinking_habit_data.length; i++) {
        drinking_habit_datalist.add(drinking_habit_data[i]['name']);
      }
      for (var i = 0; i < eating_habit_data.length; i++) {
        eating_habit_datalist.add(eating_habit_data[i]['name']);
      }
      for (var i = 0; i < smoking_habit_data.length; i++) {
        smoking_habit_datalist.add(smoking_habit_data[i]['name']);
      }
      for (var i = 0; i < physical_data.length; i++) {
        physical_datalist.add(physical_data[i]['name']);
      }
      for (var i = 0; i < mother_tongue_data.length; i++) {
        mother_tongue_datalist.add(mother_tongue_data[i]['name']);
      }
      for (var i = 0; i < profileCreatedFor.length; i++) {
        profileCreatedForlist.add(profileCreatedFor[i]['name']);
      }
      for (var i = 0; i < body_type_data.length; i++) {
        body_type_datalist.add(body_type_data[i]['name']);
      }

      strs1 = heightlist.map((e) => e.toString()).toList();
      strs2 = weight_datalist.map((e) => e.toString()).toList();
      strs3 = marital_datalist.map((e) => e.toString()).toList();
      strs4 = drinking_habit_datalist.map((e) => e.toString()).toList();
      strs5 = eating_habit_datalist.map((e) => e.toString()).toList();
      strs6 = smoking_habit_datalist.map((e) => e.toString()).toList();
      strs7 = physical_datalist.map((e) => e.toString()).toList();
      strs8 = mother_tongue_datalist.map((e) => e.toString()).toList();
      strs9 = profileCreatedForlist.map((e) => e.toString()).toList();
      strs10 = body_type_datalist.map((e) => e.toString()).toList();
    });
  }

  Future<void> saveBasicDetails(
    profile_created_for,
    name,
    dob,
    height,
    weight,
    maritial_status,
    body_type,
    mother_tongue,
    eating_habits,
    drinking_habits,
    smoking_habits,
  ) async {
    var url =
         baselink +"basicDetails";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    final MyController con = Get.find();
    SharedPreferences pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');
    //  print(id);
    var finalurl = Uri.parse(url);
    var body = {
      'reg_id': regId,
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
      'profile_created_for': profile_created_for,
      'name': name,
      'dob': dob,
      'height': height,
      'weight': weight,
      'maritial_status': maritial_status,
      'body_type': body_type,
      'mother_tongue': mother_tongue,
      'eating_habits': eating_habits,
      'drinking_habits': drinking_habits,
      'smoking_habits': smoking_habits,
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
    // setState(() {});
    if (decodeValue['status']) {
      Get.offAll(bottomsheet());
      //   }
      // confirmragistration();
      // pref.setString('regId', decodeValue['data']['register_id'].toString());

    }
    // if (decodeValue['status']) {
    //   SharedPreferences pref = await SharedPreferences.getInstance();
    //   pref.setString('temp_id', decodeValue['data']['user_temp_id'].toString());
  }
}
