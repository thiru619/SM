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
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:easy_autocomplete/easy_autocomplete.dart';

import '../bottomsheet.dart';
import '../language_btn.dart';
import 'edit_profile.dart';

var baseurl =
    'http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/';

// TextEditingController dhosam = TextEditingController();
TextEditingController rassi = TextEditingController();
TextEditingController Star = TextEditingController();
TextEditingController zodiac = TextEditingController();
TextEditingController weight = TextEditingController();
TextEditingController caste = TextEditingController();
TextEditingController subcaste = TextEditingController();
TextEditingController Religion = TextEditingController();
TextEditingController dosham = TextEditingController();

List<String> strs1 = [];
List<String> strs2 = [];
List<String> strs3 = [];
List<String> strs4 = [];
List<String> strs5 = [];
List<String> strs6 = [];

class religion_detail extends StatefulWidget {
  const religion_detail({Key? key}) : super(key: key);

  @override
  State<religion_detail> createState() => _religion_detailState();
}

class _religion_detailState extends State<religion_detail>
    with SingleTickerProviderStateMixin {
  var usernameController;

  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  var religion_arr = [];
  var religion_arrList = [];
  var caste_arr = [];
  var caste_arrList = [];
  var star_arr = [];
  var star_arrList = [];
  var raasi_arr = [];
  var raasi_arrList = [];
  var zodiac_arr = [];
  var zodiac_arrList = [];
  var religions = [];
  var dosham_arr = [];
  var dosham_arrList = [];

  // final _formKey = GlobalKey<FormState>();
  TabController? tabController;
  //  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    getData1();
    getData();
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

  final _formKeys = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        // title: Text(
        //   "Partner Preferences".tr,
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
        child: Form(
          key: _formKeys,
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
                    controller: Religion,
                    decoration: InputDecoration(
                        hintText: 'Religion',
                        suffixIcon: Icon(Icons.arrow_drop_down)),
                    suggestions: strs1,
                    onChanged: (value) => print('onChanged value: $value'),
                    onSubmitted: (value) {
                      print('onSubmitted value: $value');
                      getcaste(value);
                    }),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 10),
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
                  controller: caste,
                  decoration: InputDecoration(
                      hintText: 'Caste',
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
                      "Sub Caste (Optional)".tr,
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
                  controller: subcaste,
                  decoration: InputDecoration(
                    hintText: 'Sub Caste',
                  ),
                  // suffixIcon: Icon(Icons.arrow_drop_down)),
                  // suggestions: strs26,
                  // onChanged: (value) => print('onChanged value: $value'.tr),
                  // onSubmitted: (value) => print('onSubmitted value: $value'.tr),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Row(
                  children: [
                    Text(
                      "Zodiac".tr,
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
                  controller: zodiac,
                  decoration: InputDecoration(
                      hintText: 'Zodiac',
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
                      "Star".tr,
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
                  controller: Star,
                  decoration: InputDecoration(
                      hintText: 'Star',
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
                      "Rassi".tr,
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
                  controller: rassi,
                  decoration: InputDecoration(
                      hintText: 'Rassi',
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
                      "Dhosam".tr,
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
                  controller: dosham,
                  decoration: InputDecoration(
                      hintText: 'Dhosam',
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
                    // Get.offAll(bottomsheet(
                    //   currentIndex: 0,
                    // ));
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => bottomsheet()),
                    //   );
                    print(dosham.text);
                    print(subcaste.text);
                    print(caste.text);

                    if (Religion.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Enter Religion');
                    } else if (caste.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Enter Caste');
                    } else if (Star.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Enter Star');
                    } else if (rassi.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Enter Rassi');
                    } else if (zodiac.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Enter Zodiac');
                    } else if (dosham.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Enter dosham');
                    } else {
                      saveReligionDetails(
                          Religion.text,
                          caste.text,
                          subcaste.text,
                          Star.text,
                          rassi.text,
                          zodiac.text,
                          dosham.text);
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
      ),
    );
  }

  Future<void> getData() async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/editReligiousProfile";
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
      Religion.text = decodeValue['data']['religion'];
      caste.text = decodeValue['data']['caste'];
      subcaste.text = decodeValue['data']['sub_caste'];
      Star.text = decodeValue['data']['star'];
      rassi.text = decodeValue['data']['raasi'];
      zodiac.text = decodeValue['data']['zodiac'];
      dosham.text = decodeValue['data']['dosham'];

      // religion_arr = decodeValue['data']['religion_arr'];
      // caste_arr = decodeValue['data']['caste_arr'];

      star_arr = decodeValue['data']['star_arr'];
      raasi_arr = decodeValue['data']['raasi_arr'];

      zodiac_arr = decodeValue['data']['zodiac_arr'];
      dosham_arr = decodeValue['data']['dosham_arr'];

      // for (var i = 0; i < religion_arr.length; i++) {
      //   religion_arrList.add(religion_arr[i]['name'.tr]);
      // }
      for (var i = 0; i < star_arr.length; i++) {
        star_arrList.add(star_arr[i]['name'.tr]);
      }

      for (var i = 0; i < raasi_arr.length; i++) {
        raasi_arrList.add(raasi_arr[i]['name'.tr]);
      }

      for (var i = 0; i < zodiac_arr.length; i++) {
        zodiac_arrList.add(zodiac_arr[i]['name'.tr]);
      }
      for (var i = 0; i < dosham_arr.length; i++) {
        dosham_arrList.add(dosham_arr[i]['name'.tr]);
      }

      // strs1 = religion_arrList.map((e) => e.toString()).toList();

      strs3 = star_arrList.map((e) => e.toString()).toList();
      strs4 = raasi_arrList.map((e) => e.toString()).toList();
      strs5 = zodiac_arrList.map((e) => e.toString()).toList();
      strs6 = dosham_arrList.map((e) => e.toString()).toList();
    });
  }

  Future<void> getData1() async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/getRegister";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    // var pref = await SharedPreferences.getInstance();
    // var regid = pref.getString('regsId');
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
      religions = decodeValue['data']['religions'];

      for (var i = 0; i < religions.length; i++) {
        religion_arrList.add(religions[i]['name'.tr]);
      }
      strs1 = religion_arrList.map((e) => e.toString()).toList();
    });
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
    setState(() {
      for (var i = 0; i < casteList1.length; i++) {
        print('bbbb' + casteList1.toString());
        caste_arrList.add(casteList1[i]['name']);
        // religionslist.add(religions[i]['name']);

      }
    });
    print(response.body.toString());
    strs2 = caste_arrList.map((e) => e.toString()).toList();
  }

  Future<void> saveReligionDetails(
    religion,
    caste,
    sub_caste,
    star,
    raasi,
    zodiac,
    dosham,
  ) async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/saveReligionDetails";
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
      'religion': religion,
      'caste': caste,
      'sub_caste': sub_caste,
      'star': star,
      'raasi': raasi,
      'zodiac': zodiac,
      'dosham': dosham,
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
