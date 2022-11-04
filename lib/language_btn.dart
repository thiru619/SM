import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'languagecontroler.dart';

bool isSwitchOn = false;

class LanguageBtn extends StatefulWidget {
  const LanguageBtn({Key? key}) : super(key: key);

  @override
  State<LanguageBtn> createState() => _LanguageBtnState();
}

class _LanguageBtnState extends State<LanguageBtn> {
  bool status = false;
  final MyController con = Get.find();
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      height: 20,
      width: 40,
      toggleColor: Colors.white,
      toggleSize: 14,
      activeColor: Colors.green,
      inactiveColor: Color.fromARGB(255, 255, 111, 0),
      value: con.lancode.value == 'en' ? false : true,
      onToggle: (value) {
        print(value);
        if (!value) {
          Get.updateLocale(Locale('en', 'US'));
          con.setlancode('en');
          con.setlancountry('US');
        } else {
          Get.updateLocale(Locale('vi', 'VN'));
          con.setlancode('vi');
          con.setlancountry('VN');
        }
        setState(() {
          isSwitchOn = value;
        });
      },
    );
  }
}
