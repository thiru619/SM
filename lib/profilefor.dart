import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sujithamatrimony/languagecontroler.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(
//     home: profilefor(),
//     // debugShowCheckedModeBanner: true,
//   ));
// }

class profilefor extends StatefulWidget {
  const profilefor({Key? key}) : super(key: key);

  @override
  State<profilefor> createState() => _profileforState();
}

class _profileforState extends State<profilefor> {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    super.initState();
    // secureScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 231, 231, 231),
          toolbarHeight: 100,
          title: Container(
            width: 250,
            height: 40,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 231, 231, 231),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    hintText: '  Search...',
                    border: InputBorder.none),
              ),
            ),
          )),
      body: Container(),
    );
  }
}
