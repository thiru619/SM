import 'package:flutter/material.dart';
import 'package:sujithamatrimony/language_btn.dart';

class mail extends StatefulWidget {
  const mail({Key? key}) : super(key: key);

  @override
  State<mail> createState() => _mailState();
}

class _mailState extends State<mail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Mail",
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
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(-30)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color.fromARGB(255, 104, 231, 106),
                Color.fromARGB(255, 37, 131, 44),
                Color.fromARGB(255, 78, 207, 143),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Mail',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
