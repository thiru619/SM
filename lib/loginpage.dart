import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'bottomsheet.dart';
import 'forgetpass.dart';
import 'language_btn.dart';
import 'register.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class loginpage extends StatefulWidget {
  loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    super.initState();
    // secureScreen();
  }

  var size, height, width;

  bool isSwitchOn = false;
  bool status = false;

  final MyController con = Get.find();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // title: Text(
          //   "LOGO",
          //   style: TextStyle(color: Colors.orange),
          // ),
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
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  LanguageBtn(),
                  Text(
                    " తె",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 84, 6),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: text(),
      ),
    );
  }
}

class text extends StatefulWidget {
  const text({Key? key}) : super(key: key);

  @override
  State<text> createState() => _textState();
}

class _textState extends State<text> {
  bool _isObscure = true;
  TextEditingController namefield = TextEditingController();
  TextEditingController passwordfield = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(children: [
        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'login'.tr,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                // color: Color.fromARGB(255, 112, 16, 129)
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: namefield,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'matrimonyid'.tr,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: passwordfield,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: "password".tr,
                  suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  child: Text(
                    "login".tr,
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
                    if (namefield.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg:
                              "Please Enter Matrimony ID or UserName or Mobile No");
                    } else if (passwordfield.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Please Enter Password");
                    } else {
                      login(namefield.text, passwordfield.text);
                    }
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => bottomsheet()),
                    // );
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text(
                        'login via otp'.tr,
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 111, 0)),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => forgetpass()),
                        // );
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
                        'forgot Password?'.tr,
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 111, 0)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => forgetpass()),
                        );
                      },
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text('not a member?'.tr),
                  TextButton(
                    child: Text(
                      "registerfree".tr,
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {
                      print("object");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => register()),
                      );
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )
            ],
          ),
        ),
      ]),
    );
  }

  Future<void> login(username, password) async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/login";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    final MyController con = Get.find();

    //  print;
    var finalurl = Uri.parse(url);
    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      'username': username,
      'password': password
    });

    print('login check' + res.body);
    // var decodeValue = json.decode(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {});
    if (decodeValue['status'] == true) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('regsId', decodeValue['data']['reg_id'].toString());
      // pref.setString('regId', decodeValue['data']['reg_id'].toString());

      pref.setString('username', decodeValue['data']['name'].toString());
      pref.setString('login_id', decodeValue['data']['login_id'].toString());
      pref.setString(
          'profilephoto', decodeValue['data']['profile_image'].toString());
      print(decodeValue['data']['reg_id'].toString());
      Get.to(() => bottomsheet());

      Fluttertoast.showToast(msg: decodeValue['message']);
    } else {
      Fluttertoast.showToast(msg: decodeValue['message']);
    }
  }
}
