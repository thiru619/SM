import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:sujithamatrimony/registration2.dart';
import 'language_btn.dart';
import 'profilefor.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:http/http.dart' as http;
import 'registration.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:date_time_picker/date_time_picker.dart';

var baseurl =
    'http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/';

TextEditingController mobilenumberfield = new TextEditingController();

int _value = 0;

class register extends StatefulWidget {
  register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    // secureScreen();

    super.initState();
  }

  bool status = true;
  bool isSwitchOn = false;

  TextEditingController namefield = TextEditingController();
  TextEditingController passwordfield = TextEditingController();
  final MyController con = Get.find();

  // TextEditingController namefield = TextEditingController();
  // TextEditingController passwordfield = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image(image: AssetImage("assets/sujithalogo.png")),
        automaticallyImplyLeading: false,
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
                      color: Color.fromARGB(255, 0, 84, 6),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      body: registerlist(),
    );
  }
}

final TextEditingController DateController = new TextEditingController();
final TextEditingController _con1 = TextEditingController();

class registerlist extends StatefulWidget {
  const registerlist({Key? key}) : super(key: key);

  @override
  State<registerlist> createState() => _registerlistState();
}

class _registerlistState extends State<registerlist> {
  String dropdownvalue = 'Day';
  var profilecreatedfor = [];

  var mothertongue = [];

  List<String> strs = [];
  List<String> strs1 = [];
  List<String> strs2 = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  DateTime _dateTime = DateTime(2022);
  //  String _selectedDate;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        print(picked);
        print(picked.toString().split(' ')[0]);
        DateController.text = picked.toString().split(' ')[0];
      });
    }
  }

  var profilecreatedforlist = [];
  var religionslist = [];
  var mothertonguelist = [];
  bool _isObscure = true;
  int _value = 0;

  TextEditingController profilefor = new TextEditingController();
  TextEditingController namesfield = new TextEditingController();

  TextEditingController mothertong = new TextEditingController();

  // TextEditingController countrycodefield = new TextEditingController();

  TextEditingController emailfield = new TextEditingController();
  TextEditingController passwordfield = new TextEditingController();
  // TextEditingController c = new TextEditingController();

  DateTime date = DateTime(1900, 07, 28);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Text(
                    "LAKHS OF HAPPY MARRIAGES".tr,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "YOURS COULD BE THE NEXT".tr,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Image.asset(
                    "assets/wed.jpg",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "FIND THE PERPECT MATCH REGISTER HERE".tr,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "    PROFILE CREATED FOR".tr,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 7,
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
                                progressIndicatorBuilder:
                                    CircularProgressIndicator(
                                        color: Colors.orange),
                                debounceDuration: Duration(microseconds: 1),
                                controller: profilefor,
                                decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.arrow_drop_down)),
                                asyncSuggestions: ((searchValue) async {
                                  return strs;
                                }),
                                // onChanged: (value) =>
                                //     print('onChanged value: $value'.tr),
                                onSubmitted: (value) =>
                                    print('onSubmitted value: $value'.tr))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            child: Column(children: [
          Row(
            children: [
              Text(
                "    Name".tr,
              )
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(right: 15, left: 15),
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: namesfield,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z. ]")),
                ],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                ),
                // controller: _con1,
              ),
            ),
          ),
        ])),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Row(
            children: [
              Text(
                "     GENDER".tr,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () => setState(() => _value = 0),
                child: Container(
                  height: 96,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: _value == 0 ? Colors.orange : Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Male".tr,
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 130, 33, 175).withOpacity(0.5),
                    // spreadRadius: 5,
                    blurRadius: 6,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () => setState(() => _value = 1),
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: _value == 1 ? Colors.orange : Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Female".tr,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          // padding: EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "    DATE OF BRITH".tr,
              ),
              Container(
                padding: EdgeInsets.only(left: 8),
                // height: 40,
                margin:
                    EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                // margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
                child: TextFormField(
                  enabled: true,
                  controller: DateController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, top: 13),
                      suffixIcon: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: IconButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2400),
                              );
                              if (newDate == null) return;
                              setState(() {
                                if (isAdult(DateFormat('dd-MM-yyyy')
                                    .format(newDate)
                                    .toString())) {
                                  DateController.text = DateFormat('dd-MM-yyyy')
                                      .format(newDate)
                                      .toString();
                                } else {
                                  Fluttertoast.showToast(
                                      msg:
                                          'You should be 18 years old to register');
                                }
                              });
                            },
                            icon: Icon(Icons.calendar_month)),
                      ),
                      enabled: false,
                      border: InputBorder.none),
                  // ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        "    MOTHER TONGUE".tr,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 7,
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
                          progressIndicatorBuilder:
                              CircularProgressIndicator(color: Colors.orange),
                          debounceDuration: Duration(microseconds: 1),
                          controller: mothertong,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.arrow_drop_down)),
                          asyncSuggestions: ((searchValue) async {
                            return strs2;
                          }),
                          // onChanged: (value) =>
                          //     print('onChanged value: $value'.tr),
                          onSubmitted: (value) =>
                              print('onSubmitted value: $value'.tr))),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Column(children: [
                Row(
                  children: [
                    Text(
                      "    MOBILE NUMBER".tr,
                    )
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(right: 15, left: 15),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: mobilenumberfield,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                      ),
                      // controller: _con1,
                    ),
                  ),
                ),
              ])),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Column(children: [
                Row(
                  children: [
                    Text(
                      "    EMAIL".tr,
                    )
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.only(right: 15, left: 15),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: emailfield,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                      ),
                      // controller: _con1,
                    ),
                  ),
                ),
              ])),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "    PASSWORD".tr,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 12),
                      height: 50,
                      margin: EdgeInsets.only(right: 15, left: 15),
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1, color: Colors.grey)),
                      // padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextField(
                            controller: passwordfield,
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 180,
                      height: 50,
                      child: ElevatedButton(
                          child: Text(
                            "Register Free".tr,
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.orange),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            print(
                              profilefor.text,
                            );
                            print(namesfield.text);
                            print(_value == 0 ? 'Male' : 'female');
                            print(DateController.text);
                            print(mothertong.text);
                            print(mobilenumberfield.text);
                            print(emailfield.text);
                            print(passwordfield.text);

                            if (profilefor.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'select Profile Created For');
                            } else if (namesfield.text.isEmpty) {
                              Fluttertoast.showToast(msg: 'Enter Your Name');
                            } else if (_value.toString() == 'null') {
                              Fluttertoast.showToast(msg: 'select Gender');
                            } else if (DateController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'select Date of Brith');
                            }
                            // else if (religionfor.text.isEmpty) {
                            //   Fluttertoast.showToast(msg: 'select Religion');
                            // }
                            else if (mothertong.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'select Mother Tongue');
                            } else if (mobilenumberfield.text.length != 10) {
                              Fluttertoast.showToast(
                                  msg: 'Enter valid Mobile Number');
                            } else if (!emailfield.text.isEmail) {
                              Fluttertoast.showToast(msg: 'Enter EMail ID');
                            } else if (passwordfield.text.isEmpty) {
                              Fluttertoast.showToast(msg: 'Enter Password');
                            } else {
                              postbasicdetail(
                                  profilefor.text,
                                  namesfield.text,
                                  _value == 0 ? 'Male' : 'female',
                                  DateController.text,
                                  mothertong.text,
                                  mobilenumberfield.text,
                                  emailfield.text,
                                  passwordfield.text);
                            }

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => registration()),
                            // );
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "By clicking this button you accept".tr,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => registration()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const <TextSpan>[
                            TextSpan(
                              text: 'our ',
                            ),
                            TextSpan(
                                text: 'Terms and Conditions & Privacy Policy',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  bool isAdult(String birthDateString) {
    String datePattern = "dd-MM-yyyy";

    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
    DateTime today = DateTime.now();

    int yearDiff = today.year - birthDate.year;
    int monthDiff = today.month - birthDate.month;
    int dayDiff = today.day - birthDate.day;

    return yearDiff > 18 || yearDiff == 18 && monthDiff >= 0 && dayDiff >= 0;
  }

  Future<void> getData() async {
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

    print('hi' + res.body);
    // var decodeValue = json.decode(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {
      profilecreatedfor = decodeValue['data']['profile_created_for'.tr];

      mothertongue = decodeValue['data']['mother_tongue'];
      for (var i = 0; i < profilecreatedfor.length; i++) {
        profilecreatedforlist.add(profilecreatedfor[i]['name'.tr]);
        // religionslist.add(religions[i]['name']);

      }

      for (var i = 0; i < mothertongue.length; i++) {
        mothertonguelist.add(mothertongue[i]['name']);
        // religionslist.add(religions[i]['name']);

      }
      // print('ssss' + religions.toString());

      print(profilecreatedforlist.runtimeType);
      strs = profilecreatedforlist.map((e) => e.toString()).toList();

      strs2 = mothertonguelist.map((e) => e.toString()).toList();
      print(strs.runtimeType);
      print(strs1.runtimeType);

      // ad_banner=decodeValue['data']['main_banner'];

      print(profilecreatedfor);
    });
  }

  Future<void> postbasicdetail(profile_created_for, name, gender, dob,
      mother_tongue, mobile_no, email_id, password) async {
    print('hi');
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/basicDetails";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    final MyController con = Get.find();

    //  print(id);
    var finalurl = Uri.parse(url);
    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      'language': con.lancode.value == 'en' ? 'en' : 'tu',
      'profile_created_for': profile_created_for,
      'name': name,
      'gender': gender,
      'dob': dob,
      'mother_tongue': mother_tongue,
      'mobile_no': mobile_no,
      'email_id': email_id,
      'password': password,
    });

    print('hi' + res.body);
    // var decodeValue = json.decode(res.body);
    var decodeValue = json.decode(res.body);
    // print('hid' + decodeValue);
    if (this.mounted) {
      setState(() {});
      if (decodeValue['status'] == true) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString(
            'temp_id', decodeValue['data']['user_temp_id'].toString());
        print('out' + pref.getString('temp_id').toString());
        // pref.setString('username', decodeValue['data']['name'].toString());
        Get.to(() => registration());
        Fluttertoast.showToast(msg: decodeValue['message']);
      } else {
        Fluttertoast.showToast(msg: decodeValue['message']);
      }
    }
  }
}
