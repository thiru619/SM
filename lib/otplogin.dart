import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'otploginnext.dart';

TextEditingController mobilenumber1 = TextEditingController();

class Otplogin extends StatefulWidget {
  const Otplogin({Key? key}) : super(key: key);

  @override
  State<Otplogin> createState() => _OtploginState();
}

class _OtploginState extends State<Otplogin> {
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
          "Login",
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
                  controller: mobilenumber1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'matrimonyid'.tr,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Otploginnext()),
                  );
                  // if (mobilenumber.text.isEmpty ||
                  //     mobilenumber.text.length != 10) {
                  //   Fluttertoast.showToast(msg: 'select Mobile Number');
                  // } else {
                  //   forgot_password(
                  //     mobilenumber.text,
                  //   );
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
