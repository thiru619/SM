import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:sujithamatrimony/colors.dart';

import 'language_btn.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: weddingservices(),
    debugShowCheckedModeBanner: false,
  ));
}

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
    // secureScreen();
  }

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
            //  const BoxDecoration(
            //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(-30)),
            //   gradient: LinearGradient(
            //     begin: Alignment.topLeft,
            //     end: Alignment.bottomRight,
            //     colors: <Color>[
            //       Color.fromARGB(255, 104, 231, 106),
            //       Color.fromARGB(255, 37, 131, 44),
            //       Color.fromARGB(255, 78, 207, 143),
            //     ],
            //   ),
            // ),
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
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        "Photography Services",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                "View more",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Card(
                  child: Image(image: AssetImage("assets/photograph.jpg")),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "D3 Photography",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Mobile NO: 9856513132",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "D3@gmail.com",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                                MaterialStateProperty.all<Color>(Colors.green),
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
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => BottamBar(
                            //             currentindex: 0,
                            //           )),
                            // );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        "Mehandi Services",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                "View more",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  width: 500,
                  child: Card(
                    child: Image(
                      image: AssetImage("assets/mehandi.jfif"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Archana Mehandi Services",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Mobile NO: 9856513132",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "archana@gmail.com",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                                MaterialStateProperty.all<Color>(Colors.green),
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
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => BottamBar(
                            //             currentindex: 0,
                            //           )),
                            // );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        "Mahal Services",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                "View more",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  width: 500,
                  child: Card(
                    child: Image(
                      image: AssetImage("assets/mahal.jfif"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Irwin Wedding Hall",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Mobile NO: 9856513132",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "irwin@gmail.com",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                                MaterialStateProperty.all<Color>(Colors.green),
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
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => BottamBar(
                            //             currentindex: 0,
                            //           )),
                            // );
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
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
