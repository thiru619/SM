import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/bottomsheet.dart';
import 'package:sujithamatrimony/translation.dart';
import 'languagecontroler.dart';
import 'loginpage.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:sizer/sizer.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'register.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_popup/internet_popup.dart';

// import 'package:flutter_offline/flutter_offline.dart';
// import 'package:internet_popup/internet_popup.dart';

// import 'package:custom_splash/custom_splash.dart';
// @dart=2.9

TextEditingController Referalcode = TextEditingController();

void main() async {
  GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData(
            fontFamily: 'google_sans',
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          // theme: ThemeData.light(),
          home: MyApps(),
        );
      },
    );
  }
}

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // title: 'EarHook',
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
            duration: 2000,
            splash: Image.asset(
              "assets/sujithalogo.png",
              width: 170,
              height: 170,
              fit: BoxFit.cover,
            ),
            splashIconSize: 200,
            nextScreen: secondscreen(),
            splashTransition: SplashTransition.rotationTransition,
            // curve: Curves.slowMiddle,
            // pageTransitionType: PageTransitionType.rotate,
            backgroundColor: Colors.white));
  }
}

class secondscreen extends StatefulWidget {
  const secondscreen({Key? key}) : super(key: key);

  @override
  State<secondscreen> createState() => _secondscreenState();
}

class _secondscreenState extends State<secondscreen> {
  @override
  void initState() {
    super.initState();
    InternetPopup().initialize(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: firstscreen(),
    );
  }
}

class firstscreen extends StatelessWidget {
  final MyController con = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    // secureScreen() async {
    //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    // }

    @override
    void initState() {
      // secureScreen();
      // InternetPopup().initialize(context: context);
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MultiLanguage Demo',
      locale: Locale(con.lancode.value, con.lancountry.value),
      translations: ChangeLanguage(),
      theme: ThemeData(
        fontFamily: 'google_sans',
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: bodypart()),
    );
  }
}

final MyController con = Get.find();

class bodypart extends StatefulWidget {
  bodypart({Key? key}) : super(key: key);

  @override
  State<bodypart> createState() => _bodypartState();
}

class _bodypartState extends State<bodypart> {
  @override
  TextEditingController namefield = TextEditingController();
  TextEditingController passwordfield = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          // margin: EdgeInsets.fromLTRB(10, 60, 10, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
            // margin: EdgeInsets.fromLTRB(10, 60, 10, 0),
          ),
          // height: 400,
          child: Column(
            children: [
              Image(
                image: AssetImage(
                  "assets/sujithalogo.png",
                ),
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 30,
              ),
              Text("Matrimony",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                      fontSize: 30)),
              SizedBox(
                height: 20,
              ),
              Text(
                "Choose Your Language",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40, width: 100,
                // padding: EdgeInsets.only(left: 100, right: 100),
                child: ElevatedButton(
                  child: Text(
                    "English",
                    style: TextStyle(fontSize: 17),
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
                  onPressed: () async {
                    var pref = await SharedPreferences.getInstance();
                    var regId = pref.getString('regsId');
                    if (regId == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => loginpage()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => bottomsheet()),
                      );
                    }

                    Get.updateLocale(Locale('en', 'US'));
                    con.setlancode('en');
                    con.setlancountry('US');

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => loginpage()),
                    // );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40, width: 100,
                // padding: EdgeInsets.only(left: 100, right: 100),
                child: ElevatedButton(
                  child: Text(
                    "తెలుగు",
                    style: TextStyle(fontSize: 20),
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

                  onPressed: () async {
                    var pref = await SharedPreferences.getInstance();
                    var regId = pref.getString('regsId');
                    if (regId == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => loginpage()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => bottomsheet()),
                      );
                    }

                    Get.updateLocale(Locale('vi', 'VN'));
                    con.setlancode('vi');
                    con.setlancountry('VN');

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => loginpage()),
                    // );
                  },

                  // shape: new RoundedRectangleBorder(
                  //   borderRadius: new BorderRadius.circular(32.0),
                  // ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                height: 40,
                //  width: 100,
                // padding: EdgeInsets.only(left: 100, right: 100),
                child: ElevatedButton(
                  child: Text(
                    "Register Free",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),

                  onPressed: () {
                    // Get.updateLocale(Locale('vi', 'VN'));
                    // con.setlancode('vi');
                    // con.setlancountry('VN');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => register()),
                    );
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            AlertDialog(
                              title: Text('REFERAL CODE'),
                              content: Column(
                                children: [
                                  TextField(
                                    onChanged: (value) {},
                                    controller: Referalcode,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Referal code"),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ElevatedButton(
                                          child: Text(
                                            "Back".tr,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .all<Color>(Color.fromARGB(
                                                        255, 255, 111, 0)),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                side: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 255, 111, 0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }),
                                      ElevatedButton(
                                          child: Text(
                                            "Submit".tr,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty
                                                    .all<Color>(Color.fromARGB(
                                                        255, 255, 111, 0)),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                side: BorderSide(
                                                  color: Color.fromARGB(
                                                      255, 255, 111, 0),
                                                ),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (Referalcode.text.isNotEmpty) {
                                              postbasicdetail(
                                                  context,
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  '',
                                                  Referalcode.text);
                                            } else {}
                                          }),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  // shape: new RoundedRectangleBorder(
                  //   borderRadius: new BorderRadius.circular(32.0),
                  // ),
                ),
              ),
              SizedBox(
                height: 150,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> postbasicdetail(context, profile_created_for, name, gender, dob,
      mother_tongue, mobile_no, email_id, password, referal_code) async {
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
      'referal_code': referal_code
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

        Navigator.pop(context);
        // Fluttertoast.showToast(msg: decodeValue['message']);
      } else {
        // Fluttertoast.showToast(msg: decodeValue['message']);
      }
    }
  }
}

class ThemeController extends GetxController {
  var isminimize = false.obs;
  var isDarkMode = false.obs;
  var isplaying = false.obs;
  // var selectedItems = false.obs;
  var name = '';

  //connectivity

  var connetstatus = 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void onInit() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
    super.onInit();
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        connetstatus.value = 5;
        break;
      case ConnectivityResult.mobile:
        connetstatus.value = 1;
        break;
      case ConnectivityResult.none:
        connetstatus.value = 3;
        // Fluttertoast.showToast(msg: "You Are Offline");

        Get.defaultDialog(
            // actions: [Lottie.asset("images/lost.json")],
            title: "You Are Offline",
            middleText: 'Turn On Network Connection');
        break;
      default:
        connetstatus.value = 3;
        break;
    }
  }
}
