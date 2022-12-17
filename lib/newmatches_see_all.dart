import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main.dart';

class newmatches_see_all extends StatefulWidget {
  const newmatches_see_all({Key? key}) : super(key: key);

  @override
  State<newmatches_see_all> createState() => _newmatches_see_allState();
}

class _newmatches_see_allState extends State<newmatches_see_all> {
  // final List<Map> myProducts =
  //     List.generate(100000, (index) => {"id": index, "name": "Product $index"})
  //         .toList();

  var see_alll = [];

  @override
  void initState() {
    getnewmatchesseeall();
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
          "New Matches",
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // implement GridView.builder
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: see_alll.length,
            itemBuilder: (BuildContext ctx, index) {
              return Column(children: [
                Container(
                  height: 70,
                  child: Image.network(
                    see_alll[index]['profile_image'].toString(),
                    // fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  see_alll[index]['name'].toString(),

                  // "Atomic Hab",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  see_alll[index]['dob'],
                  style: TextStyle(fontSize: 12),
                ),
              ]);
            }),
      ),
    );
  }

  Future<void> getnewmatchesseeall() async {
    var url =
         baselink +"UserApi/getHomePage";

    var finalurl = Uri.parse(url);
    var pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regId');

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
      see_alll = decodeValue['data'];
      print(see_alll.toString());
    });
  }
}
