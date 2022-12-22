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

class listview_allmatch extends StatefulWidget {
  const listview_allmatch({Key? key}) : super(key: key);

  @override
  State<listview_allmatch> createState() => _listview_allmatchState();
}

class _listview_allmatchState extends State<listview_allmatch> {
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
            child:

                // Container(
                //   margin: EdgeInsets.only(top: 20),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //   ),
                //   child: Column(
                //     children: [
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
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
                      ),
                    ],
                  ),
                ],
              ),
              height: 120,
              // margin: EdgeInsets.all(20),
            ),
          );
        },
      ),
    );
  }

  Future<void> listview() async {
    var url = baselink + "getHomePage";

    var finalurl = Uri.parse(url);
    var pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');
    print(regId);

    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      "reg_id": regId,
      "page": 'new',
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
