import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sujithamatrimony/colors.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:http/http.dart' as http;
import 'language_btn.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(
//     home: Chats(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

class Privacy_policy extends StatefulWidget {
  const Privacy_policy({Key? key}) : super(key: key);

  @override
  State<Privacy_policy> createState() => _Privacy_policyState();
}

class _Privacy_policyState extends State<Privacy_policy> {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    super.initState();
    get_privacy_policy();
    get_terms_condition();
    // secureScreen();
  }

  var policy;
  var termscondition;

  int _value = 0;
  bool isSwitchOn = false;
  bool status = false;
  //  final MyController con = Get.find();
  gradientclr crl = gradientclr();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: policy != null
            ? Text(
                policy['page_title'],
                style: TextStyle(color: Colors.black),
              )
            : CircularPercentIndicator(radius: 1),
        elevation: 0.5,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            policy != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(policy['page_description']),
                  )
                : CircularPercentIndicator(radius: 1),
            SizedBox(
              height: 20,
            ),
            termscondition != null
                ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        termscondition['page_title'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ])
                : CircularPercentIndicator(radius: 1),
            termscondition != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(termscondition['page_description']),
                  )
                : CircularPercentIndicator(radius: 1),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> get_privacy_policy() async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/get_privacy_policy";

    var finalurl = Uri.parse(url);

    var res = await http.get(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    });
    print(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {
      policy = decodeValue['data'];
      print(policy.toString());
    });
  }

  Future<void> get_terms_condition() async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/get_terms_condition";

    var finalurl = Uri.parse(url);

    var res = await http.get(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    });
    print(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {
      termscondition = decodeValue['data'];
      print(termscondition.toString());
    });
  }
}
