import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sujithamatrimony/loginpage.dart';

class matchingprogile_see_all extends StatefulWidget {
  const matchingprogile_see_all({Key? key}) : super(key: key);

  @override
  State<matchingprogile_see_all> createState() =>
      _matchingprogile_see_allState();
}

class _matchingprogile_see_allState extends State<matchingprogile_see_all> {
  final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();

  var see_all = [];

  @override
  void initState() {
    getmatchingseeall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text(
          "Matching new Profile",
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // implement GridView.builder
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: see_all.length,
            itemBuilder: (BuildContext ctx, index) {
              return Column(
                children: [
                  // height: 150,
                  // alignment: Alignment.center,
                  // decoration: BoxDecoration(
                  //     color: Colors.grey,
                  //     borderRadius: BorderRadius.circular(15)),

                  Container(
                    height: 70,
                    child: Image.network(
                      see_all[index]['profile_image'].toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    see_all[index]['name'].toString(),

                    // "Atomic Hab",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    see_all[index]['dob'],
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              );
            }),
      ),
    );
  }

  Future<void> getmatchingseeall() async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/getHomePage";

    var finalurl = Uri.parse(url);
    var pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regId');
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
    setState(() {
      see_all = decodeValue['data'];
      print('hello' + see_all.toString());
    });
  }
}
