import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/colors.dart';
import 'package:sujithamatrimony/loginpage.dart';
import 'package:http/http.dart' as http;

import 'languagecontroler.dart';

TextEditingController commentreview = new TextEditingController();

class Feedback1 extends StatefulWidget {
  const Feedback1({Key? key}) : super(key: key);

  @override
  State<Feedback1> createState() => _Feedback1State();
}

class _Feedback1State extends State<Feedback1> {
  @override
  void initState() {
    getReviewRating();
    super.initState();
  }

  double _currentIndex = 0;
  var review = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: ElevatedButton(
                  child: Text('Click to Your Review'),
                  onPressed: () {
                    showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Rate US'),
                            // content: Text('Do you want to exit an App?'),
                            actions: [
                              Center(
                                child: Container(
                                    child: Column(children: [
                                  RatingBar.builder(
                                    initialRating: _currentIndex,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      _currentIndex = rating;
                                      print(rating);
                                    },
                                  )
                                ])),
                              ),
                              _buildTextField(),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.orange,
                                  ),
                                  onPressed: () {
                                    saveReviewRating(commentreview.text,
                                        _currentIndex.toString());
                                    Navigator.pop(context);
                                  },
                                  child: Text('Sumbit'),
                                ),
                              ),
                            ],
                          ),
                        ) ??
                        false; //if showDialouge had returned null, then return false
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 600,
                child: ListView.builder(
                    itemCount: review.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color:
                                              Colors.grey, // Set border color
                                          width: 1.5), // Set border width
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              10.0)), // Set rounded corner radius
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 1,
                                            color: Colors.black,
                                            offset: Offset(1, 1))
                                      ] // Make rounded corner of border
                                      ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: RatingBar.builder(
                                              itemSize: 20,
                                              initialRating: double.parse(
                                                  review[index]['rating']
                                                      .toString()),
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                // _currentIndex = rating;
                                                // print(rating);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Text('Name:  ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                    review[index]['name']
                                                        .toString(),
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8, left: 8),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Comment:  ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    review[index]['comments']
                                                        .toString(),
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8, left: 8),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Time: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    review[index]['createdDt']
                                                        .toString(),
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveReviewRating(
    comments,
    rating,
  ) async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/saveReviewRating";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    final MyController con = Get.find();
    SharedPreferences pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');
    //  print(id);
    var finalurl = Uri.parse(url);
    var body = {
      'reg_id': regId,
      'comments': comments,
      'rating': rating,
    };
    // con.lancode.value == 'en' ? 'en' : 'tu',
    print(body.toString());
    var res = await http.post(finalurl,
        headers: <String, String>{
          'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
        },
        body: body);

    print('hi' + res.body);
    // var decodeValue = json.decode(res.body);
    var decodeValue = json.decode(res.body);

    if (decodeValue['status']) {
      commentreview.clear();
      _currentIndex = 0;
      getReviewRating();

      // Get.offAll(() => bottomsheet(
      //       currentIndex: 0,
      //     ));
    }
  }

  Future<void> getReviewRating() async {
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/getReviewRating";

    var finalurl = Uri.parse(url);

    var res = await http.get(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    });
    print(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {
      review = decodeValue['data']['review'];

      print(review.toString());
    });
  }
}

Widget _buildTextField() {
  final maxLines = 5;

  return Container(
    margin: EdgeInsets.all(12),
    height: maxLines * 24.0,
    child: TextField(
      controller: commentreview,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: "Enter your comments",
        fillColor: Colors.grey[300],
        filled: true,
      ),
    ),
  );
}
