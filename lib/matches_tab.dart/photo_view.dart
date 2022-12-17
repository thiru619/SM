import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/chat.dart';
import 'package:sujithamatrimony/sortby.dart';
import 'package:http/http.dart' as http;
import 'package:sujithamatrimony/view_profile.dart';

import '../main.dart';

class photo_view extends StatefulWidget {
  const photo_view({Key? key}) : super(key: key);

  @override
  State<photo_view> createState() => _photo_viewState();
}

class _photo_viewState extends State<photo_view> {
  int _value = 0;
  String radioButtonItem = ' ';
  int id = 1;
  @override
  void initState() {
    listview();
    super.initState();
  }

  var listprofile = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: listprofile.length,
        itemBuilder: (BuildContext context, int index) {
          return SingleChildScrollView(
            child: Column(children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => view_profile(
                            profile: listprofile[index]['reg_id'].toString(),
                          )));
                },
                child: Container(
                  // height: 1050,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  color: Colors.brown,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 340,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                              image: NetworkImage(
                            listprofile[index]['profile_image'].toString(),
                            // fit: BoxFit.cover,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.security,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Verified",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            listprofile[index]['name'].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            listprofile[index]['age'].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            listprofile[index]['city'].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            listprofile[index]['education'].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Colors.grey,
                        // height: 20,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.whatsapp,
                            color: Colors.greenAccent,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Whatsapp",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "I",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "Don't show",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "I",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "Shortlist",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Like her profile?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Connect now",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 25,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 250, 114, 35),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Chats()),
                                );
                              },
                              icon: Image(
                                  image: AssetImage("assets/message.png"))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }

  Future<void> listview() async {
    var url =
        baselink + "getHomePage";

    var finalurl = Uri.parse(url);
    var pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');
    print(regId);

    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      "reg_id": regId,
      "page": 'viewed',
      'limit': '0',
    });
    var decodeValue = jsonDecode(res.body);
    print(res.body);
    if (this.mounted) {
      setState(() {
        listprofile = decodeValue['data'];
        print('hello' + listprofile.toString());
      });
    }
  }
}
