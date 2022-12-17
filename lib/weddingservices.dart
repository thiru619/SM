import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:sujithamatrimony/colors.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'language_btn.dart';
import 'main.dart';

class weddingservices extends StatefulWidget {
  weddingservices({Key? key}) : super(key: key);

  @override
  State<weddingservices> createState() => _weddingservicesState();
}

class _weddingservicesState extends State<weddingservices> {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    super.initState();
    get_wedding_services();
  }

  var wedding = [];
  bool isSwitchOn = false;
  gradientclr crl = gradientclr();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.white,
        title: Text(
          "Wedding Services",
          // style: TextStyle(color: Colors.orange),
        ),
        // automaticallyImplyLeading: false,
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
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: crl.Decoration(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(-30)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color.fromARGB(255, 80, 82, 80),
                Color.fromARGB(255, 127, 128, 127),
                Color.fromARGB(255, 110, 112, 111),
              ],
            ),
          ),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: wedding.length,
              physics: ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              wedding[index]['service_name'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child:
                            Image(image: AssetImage("assets/photograph.jpg")),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              width: 150,
                              height: 40,
                              child: ElevatedButton(
                                child: Text(
                                  "Book",
                                  style: TextStyle(fontSize: 20),
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  final Uri launchUri = Uri(
                                    scheme: 'tel',
                                    path:
                                        '${wedding[index]['contact_number'].toString()}',
                                  );
                                  await launchUrl(launchUri);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    ));
  }

  Future<void> get_wedding_services() async {
    var url =
         baselink +"get_wedding_services";

    var finalurl = Uri.parse(url);

    var res = await http.get(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    });
    print(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {
      wedding = decodeValue['data'];
      print(wedding.toString());
    });
  }
}
