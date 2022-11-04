import 'package:flutter/material.dart';

class search_screen extends StatefulWidget {
  const search_screen({Key? key}) : super(key: key);

  @override
  State<search_screen> createState() => _search_screenState();
}

class _search_screenState extends State<search_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder")),
      //   body: ListView.builder(
      //     shrinkWrap: true,
      //     itemCount: 5,
      //     itemBuilder: (BuildContext context, int index) {
      //       return GestureDetector(
      //         onTap: () {
      //           // Navigator.of(context).push(MaterialPageRoute(
      //           //     builder: (context) => view_profile(
      //           //           profile: listprofile[index]['reg_id'].toString(),
      //           //         )));
      //         },
      //         child: Column(
      //           children: [
      //             Container(
      //               margin: EdgeInsets.only(top: 20),
      //               decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 // borderRadius: BorderRadius.circular(20),
      //                 // boxShadow: [
      //                 //   BoxShadow(
      //                 //       color: Colors.grey,
      //                 //       // offset: Offset(1, 1),
      //                 //       blurRadius: 1,
      //                 //       spreadRadius: 1),
      //                 // ]
      //               ),
      //               child: Column(
      //                 children: [
      //                   Container(
      //                     padding: EdgeInsets.all(9),
      //                     // margin: EdgeInsets.only(top: 20),
      //                     child: Row(
      //                       children: [
      //                         // Container(
      //                         //   decoration: BoxDecoration(
      //                         //     borderRadius: BorderRadius.circular(12),
      //                         //     border: Border.all(
      //                         //       width: 1,
      //                         //       color: Colors.white,
      //                         //     ),
      //                         //     boxShadow: [
      //                         //       BoxShadow(
      //                         //         color: Colors.grey,
      //                         //         offset: const Offset(
      //                         //           5.0,
      //                         //           5.0,
      //                         //         ),
      //                         //         blurRadius: 10.0,
      //                         //         spreadRadius: 2.0,
      //                         //       ), //BoxShadow
      //                         //       BoxShadow(
      //                         //         color: Colors.white,
      //                         //         offset: const Offset(0.0, 0.0),
      //                         //         blurRadius: 0.0,
      //                         //         spreadRadius: 0.0,
      //                         //       ), //BoxShadow
      //                         //     ],
      //                         //   ),
      //                         //   child: Image(
      //                         //       image: NetworkImage(
      //                         //     "  listprofile[index]['profile_image'].toString()",
      //                         //     // fit: BoxFit.cover,
      //                         //   )),
      //                         // ),
      //                         SizedBox(
      //                           width: 20,
      //                         ),
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Row(
      //                               children: [
      //                                 Text(
      //                                   " listprofile[index]['name'].toString()",
      //                                   style: TextStyle(
      //                                       fontWeight: FontWeight.bold,
      //                                       fontSize: 20,
      //                                       color:
      //                                           Color.fromARGB(255, 51, 9, 75)),
      //                                 ),
      //                                 // Text(listprofile[index]['age'].toString(),),
      //                               ],
      //                             ),
      //                             SizedBox(
      //                               height: 10,
      //                             ),
      //                             Text(
      //                               "   listprofile[index]['education'].toString()",
      //                               style: TextStyle(color: Colors.grey),
      //                             ),
      //                             Row(
      //                               children: [
      //                                 Text(
      //                                   " listprofile[index]['age'].toString()",
      //                                   style: TextStyle(color: Colors.grey),
      //                                 ),
      //                                 Text(
      //                                   ", ",
      //                                   style: TextStyle(color: Colors.grey),
      //                                 ),
      //                                 Text(
      //                                   " listprofile[index]['height'].toString()",
      //                                   style: TextStyle(color: Colors.grey),
      //                                 ),
      //                               ],
      //                             ),
      //                             Row(
      //                               children: [
      //                                 Text(
      //                                   " listprofile[index]['city'].toString()",
      //                                   style: TextStyle(
      //                                       fontWeight: FontWeight.bold),
      //                                 ),
      //                                 Text(
      //                                   ', ',
      //                                   style: TextStyle(
      //                                       fontWeight: FontWeight.bold),
      //                                 ),
      //                                 Text(
      //                                   " listprofile[index]['state'].toString()",
      //                                   style: TextStyle(
      //                                       fontWeight: FontWeight.bold),
      //                                 ),
      //                               ],
      //                             ),
      //                           ],
      //                         )
      //                       ],
      //                     ),
      //                     // margin: EdgeInsets.all(20),
      //                     height: 100,
      //                     decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         // borderRadius: BorderRadius.all(),
      //                         // boxShadow: [
      //                         //   BoxShadow(
      //                         //     color: Colors.grey,
      //                         //     offset: const Offset(
      //                         //       5,
      //                         //       5,
      //                         //     ),
      //                         //     blurRadius: 6,
      //                         //     spreadRadius: 1,
      //                         //   ),
      //                         // ],
      //                         border: Border.all(width: 0.1)),
      //                   ),
      //                   SizedBox(
      //                     height: 10,
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       );
      //     },
      //   ),
      // );
    );
  }
}
