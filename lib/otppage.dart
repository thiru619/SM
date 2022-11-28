import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pin_put/pin_put.dart';

import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:sujithamatrimony/bottomsheet.dart';
import 'package:sujithamatrimony/colors.dart';
import 'package:sujithamatrimony/homescreen.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ftoast/ftoast.dart';
import 'package:get/get.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:sujithamatrimony/photo_upload.dart';
import 'package:sujithamatrimony/register.dart';

import 'language_btn.dart';

var name;
var id;
var startTimer;
var btnEnabled = false;
bool wait = false;
int start = 30;
String buttonName = "Resend";
BoxDecoration get _pinPutDecoration {
  var boxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(0),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );
  return boxDecoration;
  // color: Colors.grey[200],
  // borderRadius: BorderRadius.circular(10.0),
}

class otppage extends StatefulWidget {
  final String otp;
  const otppage({Key? key, this.otp = ''}) : super(key: key);

  @override
  State<otppage> createState() => _otppageState();
}

class _otppageState extends State<otppage> {
  bool status = false;
  bool isSwitchOn = false;

  TextEditingController namefield = TextEditingController();
  TextEditingController passwordfield = TextEditingController();
  TextEditingController verify = TextEditingController();

  final MyController con = Get.find();

  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    super.initState();
    // secureScreen();
  }

  gradientclr crl = gradientclr();
  // bool isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    // var get = Get;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          "VERIFY MOBILE ACCOUNT".tr,
          style: TextStyle(fontSize: 13),
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
        flexibleSpace: Container(decoration: crl.Decoration()),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 40),
          width: 350,
          height: 350,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "You will receive at digit".tr,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OTP via SMS on   ".tr,
                  ),
                  Text(
                    '${mobilenumberfield.text}'.tr,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(left: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Enter the OTP".tr,
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Icon(Icons.edit)
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                // decoration: BoxDecoration(),
                height: 40,

                child: PinPut(
                    controller: verify,
                    onChanged: (o) {
                      // if (o.toString() == widget.otp) {
                      //   print('calll');

                      //   confirmRegister();
                    },
                    keyboardType: TextInputType.number,
                    submittedFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    followingFieldDecoration: _pinPutDecoration.copyWith(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    selectedFieldDecoration: _pinPutDecoration,
                    fieldsCount: 4),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 150,
                height: 40,
                child: ElevatedButton(
                    child: Text(
                      "VERIFY".tr,
                      style: TextStyle(fontSize: 16),
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
                      if (verify.text == widget.otp) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => photo_upload()),
                        // );

                        confirmRegister();
                      } else {
                        Fluttertoast.showToast(msg: 'Enter valid otp');
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => photo_upload()),
                      // );
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Didn't receive OTP yet?".tr,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text(
                        'Resend otp'.tr,
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 111, 0)),
                      ),
                      onPressed: () {
                        if (toString() == widget.otp) {
                          print('calll');

                          confirmRegister();
                        } else {
                          Fluttertoast.showToast(msg: 'Enter valid otp');
                        }
                      },
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Text("I"),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      child: Text(
                        'Verify with Missed Call'.tr,
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 111, 0)),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => forgetpass()),
                        // );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> confirmRegister() async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/confirmRegister";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    final MyController con = Get.find();

    SharedPreferences pref = await SharedPreferences.getInstance();
    name = pref.getString('username');
    id = pref.getString('login_id');
    var regIds = pref.getString('temp_id');
    //  print(id);
    var finalurl = Uri.parse(url);
    var body = {
      'reg_id': regIds,
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
    // setState(() {});
    if (decodeValue['status']) {
      pref.setString('regsId', decodeValue['data']['register_id'].toString());
      pref.setString('username', decodeValue['data']['name'].toString());
      pref.setString('login_id', decodeValue['data']['login_id'].toString());
    }
    // if (decodeValue['status']) {
    //   SharedPreferences pref = await SharedPreferences.getInstance();
    //   pref.setString('temp_id', decodeValue['data']['user_temp_id'].toString());
    Get.offAll(() => photo_upload());
  }
}
