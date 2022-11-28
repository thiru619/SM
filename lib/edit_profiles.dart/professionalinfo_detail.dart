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
import 'edit_profile.dart';

var baseurl =
    'http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/';

TextEditingController annualincome = TextEditingController();
TextEditingController employedin = TextEditingController();
TextEditingController organization = TextEditingController();
TextEditingController occupation = TextEditingController();
TextEditingController educationcategory = TextEditingController();
TextEditingController college = TextEditingController();

List<String> strs1 = [];
List<String> strs2 = [];
List<String> strs3 = [];
List<String> strs4 = [];

class professionalinfo_detail extends StatefulWidget {
  const professionalinfo_detail({Key? key}) : super(key: key);

  @override
  State<professionalinfo_detail> createState() =>
      _professionalinfo_detailState();
}

class _professionalinfo_detailState extends State<professionalinfo_detail>
    with SingleTickerProviderStateMixin {
  var usernameController;

  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  var education_arr = [];
  var education_arrList = [];
  var occupation_arr = [];
  var occupation_arrlist = [];
  var employedin_arr = [];
  var employedin_arrList = [];
  var income_arr = [];
  var income_arrList = [];

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
        // title: Text(
        //   "Professional Information".tr,
        //   style: TextStyle(fontSize: 18, color: Colors.black),
        // ),
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
                    "Education Category".tr,
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
                controller: educationcategory,
                decoration: InputDecoration(
                    hintText: 'Education Category',
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
                    "College / Institution".tr,
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
                controller: college,
                decoration: InputDecoration(
                  hintText: 'College / Institution',
                ),
                //     suffixIcon: Icon(Icons.arrow_drop_down)),
                // suggestions: strs25,
                // onChanged: (value) => print('onChanged value: $value'.tr),
                // onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Text(
                    "Occupation".tr,
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
                controller: occupation,
                decoration: InputDecoration(
                    hintText: 'Occupation',
                    suffixIcon: Icon(Icons.arrow_drop_down)),
                suggestions: strs2,
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
                    "Organization".tr,
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
                controller: organization,
                decoration: InputDecoration(
                  hintText: 'Organization',
                ),
                // suffixIcon: Icon(Icons.arrow_drop_down)),
                // suggestions: strs27,
                // onChanged: (value) => print('onChanged value: $value'.tr),
                // onSubmitted: (value) => print('onSubmitted value: $value'.tr),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  Text(
                    "Employed In".tr,
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
                controller: employedin,
                decoration: InputDecoration(
                    hintText: 'Employed In',
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
                controller: annualincome,
                decoration: InputDecoration(
                    hintText: 'Annual Income',
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
                  if (educationcategory.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'select Education Category');
                  } else if (college.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter College');
                  } else if (occupation.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Occupation');
                  } else if (organization.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Organization');
                  } else if (employedin.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Employed in');
                  } else if (annualincome.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Annual Income');
                  } else {
                    saveProfessionalDetails(
                      educationcategory.text,
                      occupation.text,
                      employedin.text,
                      annualincome.text,
                      college.text,
                      organization.text,
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
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/editprofessional";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    var pref = await SharedPreferences.getInstance();
    var regid = pref.getString('regsId');
    final MyController con = Get.find();

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
      educationcategory.text = decodeValue['data']['education'];
      occupation.text = decodeValue['data']['occupation'];
      employedin.text = decodeValue['data']['employed_in'];
      annualincome.text = decodeValue['data']['annual_income'];
      college.text = decodeValue['data']['college'];
      organization.text = decodeValue['data']['organization'];

      education_arr = decodeValue['data']['education_arr'];
      occupation_arr = decodeValue['data']['occupation_arr'];

      employedin_arr = decodeValue['data']['employedin_arr'];
      income_arr = decodeValue['data']['income_arr'];

      for (var i = 0; i < education_arr.length; i++) {
        education_arrList.add(education_arr[i]['name'.tr]);
      }
      for (var i = 0; i < occupation_arr.length; i++) {
        occupation_arrlist.add(occupation_arr[i]['name']);
      }

      for (var i = 0; i < employedin_arr.length; i++) {
        employedin_arrList.add(employedin_arr[i]['name']);
      }
      for (var i = 0; i < income_arr.length; i++) {
        income_arrList.add(income_arr[i]['salary_range']);
      }

      strs1 = education_arrList.map((e) => e.toString()).toList();
      strs2 = occupation_arrlist.map((e) => e.toString()).toList();
      strs3 = employedin_arrList.map((e) => e.toString()).toList();
      strs4 = income_arrList.map((e) => e.toString()).toList();
    });
  }

  Future<void> saveProfessionalDetails(
    education,
    occupation,
    employed_in,
    annual_income,
    college,
    organization,
  ) async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/saveProfessionalDetails";
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
      'education': education,
      'occupation': occupation,
      'employed_in': employed_in,
      'annual_income': annual_income,
      'college': college,
      'organization': organization,
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
      Get.off(bottomsheet());
    }
  }
}
