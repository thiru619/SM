import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:sujithamatrimony/colors.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:bubble/bubble.dart';
import 'package:bubble/issue_clipper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'language_btn.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(
//     home: Chats(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    super.initState();
    // secureScreen();
  }

  static const styleSomebody = BubbleStyle(
    nip: BubbleNip.leftCenter,
    color: Colors.white,
    borderColor: Colors.blue,
    borderWidth: 1,
    elevation: 4,
    margin: BubbleEdges.only(top: 8, right: 50),
    alignment: Alignment.topLeft,
  );

  static const styleMe = BubbleStyle(
    nip: BubbleNip.rightCenter,
    color: Color.fromARGB(255, 225, 255, 199),
    borderColor: Colors.blue,
    borderWidth: 1,
    elevation: 4,
    margin: BubbleEdges.only(top: 8, left: 50),
    alignment: Alignment.topRight,
  );

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
        title: Text(
          "Chats",
          // style: TextStyle(color: Colors.orange),
        ),
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
      body: Container(
        color: Colors.yellow.withAlpha(64),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            for (var i = 0; i <= 15; i += 3)
              Bubble(
                margin: BubbleEdges.only(top: 10),
                nipOffset: i.toDouble(),
                alignment: Alignment.topRight,
                nipWidth: 30,
                nipHeight: 10,
                nip: BubbleNip.rightTop,
                color: Color.fromRGBO(225, 255, 199, 1.0),
                child: Text('Hello, World!', textAlign: TextAlign.right),
              ),
            for (var i = 0; i <= 15; i += 3)
              Bubble(
                margin: BubbleEdges.only(top: 10),
                nipOffset: i.toDouble(),
                alignment: Alignment.topLeft,
                nipWidth: 30,
                nipHeight: 10,
                nip: BubbleNip.leftTop,
                child: Text('Hi, developer!'),
              ),
          ],
        ),
      ),
    );
  }
}
