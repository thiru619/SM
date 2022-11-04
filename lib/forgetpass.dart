// import 'dart:ffi';

import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:sujithamatrimony/changepass.dart';

import 'languagecontroler.dart';
import 'otp_forgot.dart';

class forgetpass extends StatefulWidget {
  const forgetpass({Key? key}) : super(key: key);

  @override
  State<forgetpass> createState() => _forgetpassState();
}

class _forgetpassState extends State<forgetpass> {
  TextEditingController mobilenumber = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Forgot Password",
          style: TextStyle(color: Colors.black),
          // textAlign: TextAlign.left,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 25, 10, 0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                child: TextField(
                  controller: mobilenumber,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Mobile number",
                      contentPadding:
                          EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 3.0))),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 6,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 100, right: 100),
              child: ElevatedButton(
                child: Text(
                  "Get OTP",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Colors.orange,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => changepass()),
                  // );
                  if (mobilenumber.text.isEmpty ||
                      mobilenumber.text.length != 10) {
                    Fluttertoast.showToast(msg: 'select Mobile Number');
                  } else {
                    forgot_password(
                      mobilenumber.text,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> forgot_password(mobile_no) async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/forgot_password";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    final MyController con = Get.find();
    SharedPreferences pref = await SharedPreferences.getInstance();
    var regId = pref.getString('temp_id');
    //  print(id);
    var finalurl = Uri.parse(url);
    var body = {
      'mobile_no': mobile_no,
      // 'language': con.lancode.value == 'en' ? 'en' : 'tu',
    };
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
    Fluttertoast.showToast(
      msg: decodeValue['data']['OTP'].toString(),
    );
    // if (decodeValue['status']) {
    //   SharedPreferences pref = await SharedPreferences.getInstance();
    //   pref.setString('temp_id', decodeValue['data']['user_temp_id'].toString());
    Get.to(() => otp_forgot(
        otp: decodeValue['data']['OTP'].toString(), mobile_no: mobile_no));
  }
}
