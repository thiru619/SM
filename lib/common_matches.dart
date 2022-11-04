import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sujithamatrimony/language_btn.dart';
import 'package:sujithamatrimony/preferencelist.dart';
import 'package:sujithamatrimony/sortby.dart';

class common_matches extends StatefulWidget {
  const common_matches({Key? key}) : super(key: key);

  @override
  State<common_matches> createState() => _common_matchesState();
}

class _common_matchesState extends State<common_matches> {
  String radioButtonItem = ' ';
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              // height: 60,
              width: double.infinity,
              // padding: EdgeInsets.fromLTRB(10, 0, 0, 0),

              // color: Colors.amber,
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.only(
                //   topLeft: Radius.circular(15),
                //   topRight: Radius.circular(15),
                // ),
              ),
              child: Expanded(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Currently, there are no',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'matches based on your',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'preferences',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      // height: 250,
                      // width: 200,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 186, 208, 240),
                        border: Border.all(
                          color: Colors.white,
                          width: 05,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Matches are shown as per your',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'partner preferences. You can',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'change your preferences to view',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Maore matches.',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            // width: 150,
                            // height: 40,
                            child: ElevatedButton(
                              child: Text(
                                "Change Your Preferences",
                                style: TextStyle(fontSize: 15),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 255, 111, 0)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(
                                      color: Color.fromARGB(255, 255, 111, 0),
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                // if (namefield.text.isEmpty) {
                                //   Fluttertoast.showToast(
                                //       msg:
                                //           "Please Enter Matrimony ID or UserName or Mobile No");
                                // } else if (passwordfield.text.isEmpty) {
                                //   Fluttertoast.showToast(msg: "Please Enter Password");
                                // } else {
                                //   login(namefield.text, passwordfield.text);
                                // }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => preferencelist()),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 210,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
