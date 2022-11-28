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

var baseurl =
    'http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/';

TextEditingController family_values = TextEditingController();
TextEditingController family_type = TextEditingController();
TextEditingController family_status = TextEditingController();
TextEditingController father_occupation = TextEditingController();
TextEditingController mother_occupation = TextEditingController();
TextEditingController brothers = TextEditingController();
TextEditingController brothers_married = TextEditingController();
TextEditingController sisters = TextEditingController();
TextEditingController sisters_married = TextEditingController();

List<String> strs1 = [];
List<String> strs2 = [];
List<String> strs3 = [];
List<String> strs4 = [];
List<String> strs5 = [];

class family_detail extends StatefulWidget {
  const family_detail({Key? key}) : super(key: key);

  @override
  State<family_detail> createState() => _family_detailState();
}

class _family_detailState extends State<family_detail>
    with SingleTickerProviderStateMixin {
  var usernameController;

  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  var familyvalues_arr = [];
  var family_type_arr = [];
  var family_status_arr = [];
  var father_occupation_arr = [];
  var mother_occupation_arr = [];
  var familyvalues_arrList = [];
  var family_type_arrList = [];
  var family_status_arrList = [];
  var father_occupation_arrList = [];
  var mother_occupation_arrList = [];

  final _formKey = GlobalKey<FormState>();
  TabController? tabController;
  //  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();

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
        title: Text(
          "Family Details".tr,
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
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Family VAlues".tr,
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
                controller: family_values,
                decoration: InputDecoration(
                    hintText: 'Family Values',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                suggestions: strs1,
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Text(
                    "Family Type".tr,
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
                controller: family_type,
                decoration: InputDecoration(
                    hintText: 'Family Type',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                suggestions: strs2,
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Text(
                    "Family Status".tr,
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
                controller: family_status,
                decoration: InputDecoration(
                    hintText: 'Family Status',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                suggestions: strs3,
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Text(
                    "Father's Occupation".tr,
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
                controller: father_occupation,
                decoration: InputDecoration(
                    hintText: "Father's Occupation",
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                suggestions: strs4,
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
                    "Mother's Occupation".tr,
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
                controller: mother_occupation,
                decoration: InputDecoration(
                    hintText: "Mother's Occupation",
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                suggestions: strs5,
                onChanged: (value) => print('onChanged value: $value'.tr),
                onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Brother(S)".tr,
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
                controller: brothers,
                decoration: InputDecoration(
                    hintText: 'Brother(S)',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                // suggestions: strs28,
                // onChanged: (value) => print('onChanged value: $value'.tr),
                // onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Brother(s) Married".tr,
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
                controller: brothers_married,
                decoration: InputDecoration(
                    hintText: 'Brother(s) Married',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                // suggestions: strs29,
                // onChanged: (value) => print('onChanged value: $value'.tr),
                // onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Sister(s)".tr,
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
                controller: sisters,
                decoration: InputDecoration(
                    hintText: 'Sister(s)',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                // suggestions: strs30,
                // onChanged: (value) => print('onChanged value: $value'.tr),
                // onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Sister(s) Married".tr,
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
                controller: sisters_married,
                decoration: InputDecoration(
                    hintText: 'Sister(s) Married',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                // suggestions: strs31,
                // onChanged: (value) => print('onChanged value: $value'.tr),
                // onSubmitted: (value) => print('onSubmitted value: $value'.tr),
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
                  // Get.offAll(bottomsheet(
                  //   currentIndex: 0,
                  // ));
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => bottomsheet()),
                  //   );
                  if (family_values.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'select Family Value');
                  } else if (family_type.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Family Type');
                  } else if (family_status.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Family Status');
                  } else if (father_occupation.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Father Occupation');
                  } else if (mother_occupation.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Mother Occupation');
                  } else if (brothers.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Brothers');
                  } else if (brothers_married.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Brother Married');
                  } else if (sisters.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Sisters');
                  } else if (sisters_married.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Sister Married');
                  } else {
                    saveFamilyDetails(
                      family_values.text,
                      family_type.text,
                      family_status.text,
                      father_occupation.text,
                      mother_occupation.text,
                      brothers.text,
                      brothers_married.text,
                      sisters.text,
                      sisters_married.text,
                    );
                  }
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
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/editfamily";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    final MyController con = Get.find();
    var pref = await SharedPreferences.getInstance();
    var regid = pref.getString('regsId');

    //  print(id);
    var finalurl = Uri.parse(url);
    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      'reg_id': regid,
      // 'language': con.lancode.value == 'en' ? 'en' : 'tu',
    });

    print(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {
      family_values.text = decodeValue['data']['family_values'];
      family_type.text = decodeValue['data']['family_type'];

      family_status.text = decodeValue['data']['family_status'];

      father_occupation.text = decodeValue['data']['father_occupation'];
      mother_occupation.text = decodeValue['data']['mother_occupation'];
      brothers.text = decodeValue['data']['brothers'];

      brothers_married.text = decodeValue['data']['brothers_married'];
      sisters.text = decodeValue['data']['sisters'];
      sisters_married.text = decodeValue['data']['sisters_married'];
      // caste = decodeValue['data'];
      familyvalues_arr = decodeValue['data']['familyvalues_arr'];
      family_type_arr = decodeValue['data']['family_type_arr'];
      family_status_arr = decodeValue['data']['family_status_arr'];
      father_occupation_arr = decodeValue['data']['father_occupation_arr'];
      mother_occupation_arr = decodeValue['data']['mother_occupation_arr'];

      for (var i = 0; i < familyvalues_arr.length; i++) {
        familyvalues_arrList.add(familyvalues_arr[i]['name'.tr]);
      }
      for (var i = 0; i < family_type_arr.length; i++) {
        family_type_arrList.add(family_type_arr[i]['name'.tr]);
      }
      for (var i = 0; i < family_status_arr.length; i++) {
        family_status_arrList.add(family_status_arr[i]['name'.tr]);
      }
      for (var i = 0; i < father_occupation_arr.length; i++) {
        father_occupation_arrList.add(father_occupation_arr[i]['name'.tr]);
      }
      for (var i = 0; i < mother_occupation_arr.length; i++) {
        mother_occupation_arrList.add(mother_occupation_arr[i]['name'.tr]);
      }

      strs1 = familyvalues_arrList.map((e) => e.toString()).toList();
      strs2 = family_type_arrList.map((e) => e.toString()).toList();
      strs3 = family_status_arrList.map((e) => e.toString()).toList();
      strs4 = father_occupation_arrList.map((e) => e.toString()).toList();
      strs5 = mother_occupation_arrList.map((e) => e.toString()).toList();
    });
  }

  Future<void> saveFamilyDetails(
    family_values,
    family_type,
    family_status,
    father_occupation,
    mother_occupation,
    brothers,
    brothers_married,
    sisters,
    sisters_married,
  ) async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/saveFamilyDetails";
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
      'family_values': family_values,
      'family_type': family_type,
      'family_status': family_status,
      'father_occupation': father_occupation,
      'mother_occupation': mother_occupation,
      'brothers': brothers,
      'brothers_married': brothers_married,
      'sisters': sisters,
      'sisters_married': sisters_married,
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
      Get.offAll(() => bottomsheet(
            currentIndex: 0,
          ));
      //   }
      // confirmragistration();
      // pref.setString('regId', decodeValue['data']['register_id'].toString());

    }
    // if (decodeValue['status']) {
    //   SharedPreferences pref = await SharedPreferences.getInstance();
    //   pref.setString('temp_id', decodeValue['data']['user_temp_id'].toString());
  }

// confirm registration

  // Future<void> confirmragistration() async {
  //   var url =
  //       "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/confirmRegister";
  //   // checker(context) async {
  //   // var pref=await SharedPreferences.getInstance();
  //   final MyController con = Get.find();
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   var regId = pref.getString('regsId');
  //   //  print(id);
  //   var finalurl = Uri.parse(url);
  //   var body = {
  //     'reg_id': regId,
  //   };
  //   // con.lancode.value == 'en' ? 'en' : 'tu',
  //   print(body.toString());
  //   var res = await http.post(finalurl,
  //       headers: <String, String>{
  //         'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
  //       },
  //       body: body);

  //   print('hi' + res.body);
  //   // var decodeValue = json.decode(res.body);
  //   var decodeValue = json.decode(res.body);
  //   // setState(() {});
  //   if (decodeValue['status']) {
  //     // pref.setString('regId', decodeValue['data']['register_id'].toString());
  //     Get.offAll(() => bottomsheet(
  //           currentIndex: 0,
  //         ));
  //   }
  //   // if (decodeValue['status']) {
  //   //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   //   pref.setString('temp_id', decodeValue['data']['user_temp_id'].toString());
  // }
}
