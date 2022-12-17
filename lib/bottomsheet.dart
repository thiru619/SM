import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sujithamatrimony/homescreen.dart';
import 'package:sujithamatrimony/mail.dart';
import 'package:sujithamatrimony/notification.dart';
import 'package:sujithamatrimony/profilefor.dart';
import 'package:sujithamatrimony/search.dart';
import 'main.dart';
import 'matches.dart';
import 'package:badges/badges.dart';

// ignore: must_be_immutable
// class bottomsheet extends StatefulWidget {
//   int currentindex;
//   bottomsheet({Key? key, required this.currentindex}) : super(key: key);

//   @override
//   State<bottomsheet> createState() => _bottomsheetState();
// }

// class _bottomsheetState extends State<bottomsheet> {
//   get bottomNavigationBar => null;

//   secureScreen() async {
//     await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
//   }

//   @override
//   void initState() {
//     super.initState();
//     secureScreen();
//   }

//   List<Widget> _widgetOptions = <Widget>[
//     homescreen(),
//     matches(),
//     mail(),
//     notification(),
//     search(),
//   ];

//   void _onItemTapped(int index) {
//     widget.currentindex = index;
//     // setState(() {});
//   }

//   DateTime? currentBackPressTime;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:
//             //  _widgetOptions.elementAt(widget.currentindex),
//             bottomNavigationBar(
//       Padding(
//         padding: const EdgeInsets.only(top: 8),
//         child: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           elevation: 5,
//           unselectedItemColor: Colors.grey,
//           showUnselectedLabels: false,
//           backgroundColor: Colors.white,
//           items: <BottomNavigationBarItem>[
//             const BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.home),
//               label: 'Home',
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.people_alt_outlined),
//               label: 'Matches',
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.mail_outline),
//               label: 'Mailbox',
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(Icons.notifications),
//               label: 'Notification',
//             ),
//             const BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.search),
//               label: 'Search',
//             ),
//           ],
//           currentIndex: widget.currentindex,
//           selectedItemColor: Get.theme.primaryColor,
//           onTap: _onItemTapped,
//         ),
//       ),
//     ));
//   }
// }
class bottomsheet extends StatefulWidget {
  int? currentIndex;
  bottomsheet({this.currentIndex});

  @override
  _bottomsheetState createState() => _bottomsheetState();
}

class _bottomsheetState extends State<bottomsheet> {
  final pages = [
    homescreens(),
    matches(),
    // mail(),
    notification(),
    search(),
  ];

  void onTap(int index) {
    widget.currentIndex = index;
    Get.offAll(bottomsheet(
      currentIndex: index,
    ));
    setState(() {});
  }

  @override
  void initState() {
    get_notification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => popFunction(),
      child: Scaffold(
        // backgroundColor: const Color(0xffC4DFCB),
        body: pages[widget.currentIndex ?? 0],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 2,
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: 'Home'.tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_alt_outlined), label: 'Matches'.tr),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.mail_outline), label: 'Mail'),
            BottomNavigationBarItem(
              icon: Badge(
                showBadge: true,
                badgeContent: Text("${notifications.length}",
                    style: const TextStyle(color: Colors.white)),
                animationType: BadgeAnimationType.slide,
                shape: BadgeShape.circle,
                //position: BadgePosition.center(),
                child: const Icon(Icons.notifications),
              ),
              label: 'Notifications'.tr,
            ),
            // icon: Icon(
            //   Icons.notifications,
            // ),
            // label: 'Notification',
            // ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search), label: 'Search'.tr),
          ],
          onTap: onTap,
          currentIndex: widget.currentIndex ?? 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
    );
  }

  DateTime? currentBackPressTime;
  Future<bool> popFunction() {
    if (widget.currentIndex != 0) {
      setState(() {
        widget.currentIndex = 0;
      });
      return Future.value(false);
    }
    DateTime now = DateTime.now();
    if (widget.currentIndex == 0 &&
        (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) > Duration(seconds: 5))) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Press again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }

  Future<void> get_notification() async {
    var url =
         baselink +"get_notification";
    // checker(context) async {
    // var pref=await SharedPreferences.getInstance();
    final MyController con = Get.find();
    SharedPreferences pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');
    //  print(id);
    var finalurl = Uri.parse(url);
    var body = {
      'reg_id': regId,
      // 'language': con.lancode.value == 'en' ? 'en' : 'tu',
    };
    print(body.toString());
    var res = await http.post(finalurl,
        headers: <String, String>{
          'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
        },
        body: body);

    print('hi' + res.body);
    // var decodeValue = json.decode(res.body);
    var decodeValue = json.decode(res.body);
    notifications.clear();
    if (this.mounted) {
      setState(() {});
    }

    if (decodeValue['status'] == true) {
      notifications = decodeValue['data'];
      print(notifications);
      // SharedPreferences pref = await SharedPreferences.getInstance();
      // pref.setString('temp_id', decodeValue['data']['user_temp_id'].toString());
      // Get.to(() => registration());

      // Fluttertoast.showToast(msg: decodeValue['message']);
    } else {
      Fluttertoast.showToast(msg: decodeValue['message']);
    }
  }
}
