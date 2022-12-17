import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/view_profile.dart';

import '../main.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: favorites(),
//     // debugShowCheckedModeBanner: true,
//   ));
// }

class listview_short extends StatefulWidget {
  const listview_short({Key? key}) : super(key: key);

  @override
  State<listview_short> createState() => _listview_shortState();
}

class _listview_shortState extends State<listview_short> {
  var listprofile = [];
  @override
  void initState() {
    listview();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: listprofile.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => view_profile(
                        profile: listprofile[index]['reg_id'].toString(),
                      )));
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(20),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.grey,
                //       // offset: Offset(1, 1),
                //       blurRadius: 1,
                //       spreadRadius: 1),
                // ]
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(9),
                    // margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ),
                          child: Image(
                              image: NetworkImage(
                            listprofile[index]['profile_image'].toString(),
                            // fit: BoxFit.cover,
                          )),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  listprofile[index]['name'].toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 51, 9, 75)),
                                ),
                                // Text(listprofile[index]['age'].toString(),),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              listprofile[index]['education'].toString(),
                              style: TextStyle(color: Colors.grey),
                            ),
                            Row(
                              children: [
                                Text(
                                  listprofile[index]['age'].toString(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  ", ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  listprofile[index]['height'].toString(),
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  listprofile[index]['city'].toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ', ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  listprofile[index]['state'].toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    // margin: EdgeInsets.all(20),
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.all(),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey,
                        //     offset: const Offset(
                        //       5,
                        //       5,
                        //     ),
                        //     blurRadius: 6,
                        //     spreadRadius: 1,
                        //   ),
                        // ],
                        border: Border.all(width: 0.1)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  new GestureDetector(
                    onTap: () {
                      print("Container clicked");
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const viewprofile()),
                      // );
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 90),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            // padding: EdgeInsets.only(left: 100, right: 100),
                            child: ElevatedButton(
                              child: Text("Send Interest"),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 60, 15, 112)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(
                                      color: Color.fromARGB(255, 60, 15, 112),
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            width: 90,
                          ),
                          LikeButton(
                            isLiked: true,
                            size: 30,
                            circleColor: CircleColor(
                                start: Color(0xff00ddff),
                                end: Color(0xff0099cc)),
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Color(0xff33b5e5),
                              dotSecondaryColor: Color(0xff0099cc),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> listview() async {
    var url =
         baselink +"getHomePage";

    var finalurl = Uri.parse(url);
    var pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');
    print(regId);

    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      "reg_id": regId,
      "page": 'shortlisted',
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
