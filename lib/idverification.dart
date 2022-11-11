import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/colors.dart';
import 'package:sujithamatrimony/loginpage.dart';
import 'package:sujithamatrimony/profilescreen.dart';
import 'package:sujithamatrimony/homescreen.dart';
import 'language_btn.dart';
import 'otppage.dart';
import 'registration2.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
// void main(List<String> args) {
//   runApp(MaterialApp(
//     home: idverification(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

class idverification extends StatefulWidget {
  const idverification({Key? key}) : super(key: key);

  @override
  State<idverification> createState() => _idverificationState();
}

class _idverificationState extends State<idverification>
    with SingleTickerProviderStateMixin {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    super.initState();
    getData();
    // secureScreen();
  }

  TextEditingController upload = TextEditingController();
  TextEditingController upload2 = TextEditingController();

  // final List<String> document = [
  //   'Pan Card',
  //   'Aadhaar',
  //   'Driving Liscense',
  //   'Passport',
  //   'Passport',
  //   'voter Id',
  // ];
  String? documentValue;

  TabController? tabController;
  //  TabController tabController;

  // @override
  // void dispose() {
  //   super.dispose();
  //   tabController.dispose();
  // }

  var verify = [];

  bool isSwitchOn = false;
  gradientclr crl = gradientclr();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: crl.Decoration(),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(bottom: 0, top: 15),
                        child: Row(
                          children: [
                            Text(
                              "E ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 111, 0),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            LanguageBtn(),
                            Text(
                              " తె",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/security.png',
                    color: Colors.white,
                  ),
                  Text(
                    'Your Profile is Pending'.tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    'Verification'.tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ID Verification".tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Select one of the below documents to verify"
                                          .tr +
                                      "          ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  "your identity infomation. The documents chosen by you will not be Shown to the  Other"
                                      .tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text(
                                  "Shown to the Other members".tr +
                                      "                                ".tr,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                Container(
                                  margin: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 128, 128, 128)
                                                .withOpacity(0.5),
                                        // spreadRadius: 5,
                                        blurRadius: 6,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  // width: Get.width / 1.5,
                                  height: 50,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2(
                                      isExpanded: true,
                                      hint: Row(
                                        children: const [
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              '  Choose Document',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      items: verify
                                          .map((verify) =>
                                              DropdownMenuItem<String>(
                                                value: verify['name'],
                                                child: Text(
                                                  "  " + verify['name'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ))
                                          .toList(),
                                      value: documentValue,
                                      onChanged: (value) {
                                        setState(() {
                                          documentValue = value as String;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        // spreadRadius: 5,
                                        blurRadius: 6,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    controller: upload,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: '  Front Image'.tr,
                                      contentPadding:
                                          new EdgeInsets.only(top: 18),
                                      border: InputBorder.none,
                                      suffixIcon: Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Container(
                                            padding: EdgeInsets.only(top: 8),
                                            child: ElevatedButton(
                                              child: Text('upload'),
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.green,
                                              ),
                                              onPressed: () async {
                                                FilePickerResult? result =
                                                    await FilePicker.platform
                                                        .pickFiles();

                                                if (result != null) {
                                                  File file = File(result
                                                      .files.single.path
                                                      .toString());
                                                  upload.text = result
                                                      .files.single.path
                                                      .toString();
                                                } else {
                                                  // User canceled the picker
                                                }
                                              },
                                            ),
                                          )), // icon is 48px widget.
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        // spreadRadius: 5,
                                        blurRadius: 6,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    controller: upload2,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: '  Back Image'.tr,
                                      contentPadding:
                                          new EdgeInsets.only(top: 18),
                                      border: InputBorder.none,
                                      suffixIcon: Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Container(
                                            padding: EdgeInsets.only(top: 8),
                                            child: ElevatedButton(
                                              child: Text('upload'),
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors.green,
                                              ),
                                              onPressed: () async {
                                                FilePickerResult? result =
                                                    await FilePicker.platform
                                                        .pickFiles();

                                                if (result != null) {
                                                  File file = File(result
                                                      .files.single.path
                                                      .toString());
                                                  upload2.text = result
                                                      .files.single.path
                                                      .toString();
                                                } else {
                                                  // User canceled the picker
                                                }
                                              },
                                            ),
                                          )), // icon is 48px widget.
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 8),
                                  child: ElevatedButton(
                                      child: Text('submit'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.green,
                                      ),
                                      onPressed: () {
                                        if (documentValue == null) {
                                          Fluttertoast.showToast(
                                              msg: 'Select Document');
                                        } else if (upload2.text.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg: 'upload Front Image');
                                        } else if (upload2.text.isEmpty) {
                                          Fluttertoast.showToast(
                                              msg: 'upload back Image');
                                        } else {
                                          getData1();
                                        }
                                      }),
                                )
                              ])
                        ],
                      ))
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getData() async {
    var pref = await SharedPreferences.getInstance();

    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/getDocumentType";

    final MyController con = Get.find();
    var finalurl = Uri.parse(url);
    // var pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');

    print(regId);

    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
    });
    var decodeValue = jsonDecode(res.body);
    print(res.body);
    setState(() {
      verify = decodeValue['data'];

      print(verify.toString());
    });
  }

  Future<void> getData1() async {
    var pref = await SharedPreferences.getInstance();

    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/saveDocuments";

    final MyController con = Get.find();
    var finalurl = Uri.parse(url);
    // var pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');

    print(regId);
    var request = new http.MultipartRequest("POST", finalurl);
    request.headers['x-api-key'] = '50f58d4facbdfe506d51ad6b079deaae';
    request.fields['reg_id'] = regId.toString();
    request.fields['language'] = con.lancode.value == 'en' ? 'en' : 'tu';
    request.fields['document_type'] = documentValue.toString();
    request.files.add(
        await http.MultipartFile.fromPath("document_front_image", upload.text));
    request.files.add(
        await http.MultipartFile.fromPath("document_back_image", upload2.text));
    request.send().then((response1) {
      http.Response.fromStream(response1).then((response) {
        if (response.statusCode == 200) {
          print("Uploaded! ");
          print('response.body ' + response.body);
          Navigator.pop(context);
        }

        return response.body;
      });
    });
  }
}
