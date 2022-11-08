import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:sujithamatrimony/colors.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:flutter_share/flutter_share.dart';
import 'language_btn.dart';

// void main(List<String> args) {
//   runApp(MaterialApp(
//     home: referralcode(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

class referralcode extends StatefulWidget {
  const referralcode({Key? key}) : super(key: key);

  @override
  State<referralcode> createState() => _referralcodeState();
}

class _referralcodeState extends State<referralcode> {
  // secureScreen() async {
  //   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  // }

  @override
  void initState() {
    super.initState();
    // secureScreen();
  }

  TextEditingController copied = TextEditingController();

  Future<void> share() async {
    await FlutterShare.share(
        title: 'Example share',
        text: 'Example share text',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Sujitha Matrimony');
  }

  int _value = 0;
  bool isSwitchOn = false;
  bool status = false;
  //  final MyController con = Get.find();
  gradientclr crl = gradientclr();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Referral code",
          // style: TextStyle(color: Colors.orange),
        ),
        automaticallyImplyLeading: false,
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
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 15),
            child: Row(
              children: [
                Text(
                  "Refer to Your Friends and Families",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(image: AssetImage("assets/gift.png")),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 5,
            margin: EdgeInsets.all(20),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: TextField(
              controller: copied,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: copied.text))
                        .then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Referal Code copied to clipboard")));
                    });
                  },
                  icon: Icon(Icons.copy_rounded),
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter a search term',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 150,
            height: 40,
            child: ElevatedButton(
              child: Text(
                "Invite",
                style: TextStyle(fontSize: 20),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 255, 111, 0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Color.fromARGB(255, 255, 111, 0),
                    ),
                  ),
                ),
              ),
              onPressed: share,
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) => BottamBar(
              //             currentindex: 0,
              //           )),
              // );
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Share With"),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                height: 40,
                image: AssetImage("assets/whatsapp.jpg"),
              ),
              SizedBox(
                width: 10,
              ),
              Image(
                height: 30,
                image: AssetImage("assets/facebook.png"),
              ),
              SizedBox(
                width: 10,
              ),
              Image(
                height: 30,
                image: AssetImage("assets/insta.webp"),
              ),
              SizedBox(
                width: 10,
              ),
              Image(
                height: 40,
                image: AssetImage("assets/twiter.png"),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
