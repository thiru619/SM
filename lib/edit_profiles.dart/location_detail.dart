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

TextEditingController ancestralorgin = TextEditingController();
TextEditingController citizenship = TextEditingController();
TextEditingController city = TextEditingController();
TextEditingController state = TextEditingController();
TextEditingController country = TextEditingController();

List<String> strs1 = [];
List<String> strs2 = [];
List<String> strs3 = [];

class location_detail extends StatefulWidget {
  const location_detail({Key? key}) : super(key: key);

  @override
  State<location_detail> createState() => _location_detailState();
}

class _location_detailState extends State<location_detail>
    with SingleTickerProviderStateMixin {
  var usernameController;

  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  var country1 = [];
  var country_arrList = [];
  var state_arr = [];
  var state_arrlist = [];
  var city_arr = [];
  var city_arrList = [];
  var countryList = [];
  var country1List = [];
  var stateList = [];
  var cityList = [];

  final _formKey = GlobalKey<FormState>();
  TabController? tabController;
  //  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    // secureScreen();
    // geteducation();
    getData1();
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
          "Location".tr,
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
                  controller: country,
                  decoration: InputDecoration(
                      hintText: 'Country',
                      suffixIcon: Icon(Icons.arrow_drop_down)),
                  suggestions: strs1,
                  onChanged: (value) => print('onChanged value: $value'),
                  onSubmitted: (value) {
                    print('onSubmitted value: $value');
                    getstate(value);
                  }),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Text(
                    "State".tr,
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
                  controller: state,
                  decoration: InputDecoration(
                      hintText: 'State',
                      suffixIcon: Icon(Icons.arrow_drop_down)),
                  suggestions: strs2,
                  onChanged: (value) => print('onChanged value: $value'),
                  onSubmitted: (value) {
                    print('onSubmitted value: $value');
                    getcity(value);
                  }),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  Text(
                    "City".tr,
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
                controller: city,
                decoration: InputDecoration(
                    hintText: 'City', suffixIcon: Icon(Icons.arrow_drop_down)),
                suggestions: strs3,
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
                    "Citizenship".tr,
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
                controller: citizenship,
                decoration: InputDecoration(
                  hintText: 'Citizenship',
                ),
                //     suffixIcon: Icon(Icons.arrow_drop_down)),
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
                    "Ancestral Orgin".tr,
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
                controller: ancestralorgin,
                decoration: InputDecoration(
                  hintText: 'Ancestral Orgin',
                ),
                //     suffixIcon: Icon(Icons.arrow_drop_down)),
                // suggestions: strs28,
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
                  if (country.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'select Country');
                  } else if (state.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter State');
                  } else if (city.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter City');
                  } else if (ancestralorgin.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Ancestral Orgin');
                  } else if (citizenship.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Citizenship');
                  } else {
                    print(whatareyoulooking);

                    saveLocationDetails(
                      country.text,
                      state.text,
                      city.text,
                      ancestralorgin.text,
                      citizenship.text,
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
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/editLocationProfile";
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
      country.text = decodeValue['data']['country'];
      state.text = decodeValue['data']['state'];
      city.text = decodeValue['data']['city'];
      citizenship.text = decodeValue['data']['citizenship'];
      ancestralorgin.text = decodeValue['data']['ancestral_orgin'];
    });
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
        stateList.add(stateList1[i]['name']);
        // religionslist.add(religions[i]['name']);

      }
    });
    print(response.body.toString());
    strs2 = stateList.map((e) => e.toString()).toList();
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
    strs3 = cityList.map((e) => e.toString()).toList();
  }

  Future<void> getData1() async {
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
      country1 = decodeValue['data']['country'];

      for (var i = 0; i < country1.length; i++) {
        country1List.add(country1[i]['name']);
      }

      strs1 = country1List.map((e) => e.toString()).toList();
    });
  }

  Future<void> saveLocationDetails(
    country,
    state,
    city,
    ancestral_orgin,
    citizenship,
  ) async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/saveLocationDetails";
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
      'country': country,
      'state': state,
      'city': city,
      'ancestral_orgin': ancestral_orgin,
      'citizenship': citizenship,
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
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Edit_profile()),
      );
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
