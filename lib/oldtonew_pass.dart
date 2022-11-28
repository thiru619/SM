import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:sujithamatrimony/loginpage.dart';

class oldtonew_pass extends StatefulWidget {
  final String otp;
  final String mobile_no;
  oldtonew_pass({Key? key, this.otp = '', this.mobile_no = ''})
      : super(key: key);

  @override
  State<oldtonew_pass> createState() => _oldtonew_passState();
}

class _oldtonew_passState extends State<oldtonew_pass> {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  TextEditingController oldpass = TextEditingController();
  TextEditingController newpass = TextEditingController();
  @override
  void initState() {
    super.initState();

    // secureScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Change Password',
          style: TextStyle(color: Colors.black),
        ),
        elevation: .5,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "Change Password",
                  //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  // ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                    child: TextField(
                      controller: oldpass,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Old password',
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: TextField(
                      controller: newpass,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'New Password',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 150,
              height: 40,
              child: ElevatedButton(
                child: Text(
                  "Submit",
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
                  if (oldpass.text.isEmpty || oldpass.text == '') {
                    Fluttertoast.showToast(msg: 'Enter old Password');
                  } else if (newpass.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter New Password');
                  } else {
                    change_password(
                      oldpass.text,
                      newpass.text,
                    );
                  }
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => BottamBar(
                  //             currentindex: 0,
                  //           )),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> change_password(old_password, confirm_password) async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/change_password";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    final MyController con = Get.find();
    SharedPreferences pref = await SharedPreferences.getInstance();
    var regIds = pref.getString('regsId');
    //  print(id);
    var finalurl = Uri.parse(url);
    var body = {
      'reg_id': regIds,
      'old_password': old_password,
      'confirm_password': confirm_password,
    };
    print(body.toString());
    var res = await http.post(finalurl,
        headers: <String, String>{
          'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae',
        },
        body: body);

    log('hi' + res.body);
    // var decodeValue = json.decode(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {});
    Fluttertoast.showToast(
      msg: decodeValue['message'].toString(),
    );
    if (decodeValue['status'] == true) {
      Get.offAll(() => loginpage());
    }
  }
}
