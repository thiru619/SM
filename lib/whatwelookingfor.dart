import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sujithamatrimony/loginpage.dart';
import 'package:sujithamatrimony/bottomsheet.dart';
import 'package:sujithamatrimony/preferencelist.dart';

var whatareyoulooking = '';

class whatwelookingfor extends StatefulWidget {
  final String usernameController;

  const whatwelookingfor({Key? key, this.usernameController = ''})
      : super(key: key);

  @override
  State<whatwelookingfor> createState() => _whatwelookingforState();
}

class _whatwelookingforState extends State<whatwelookingfor> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Partner Description',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'What we are Looking for',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              // padding: EdgeInsets.all(10),

              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        whatareyoulooking = value;
                      });
                    },
                    controller: _textEditingController, obscureText: false,
                    // controller: aboutmyselfcontroller,
                    maxLines: 7,
                    decoration: InputDecoration(
                      hintText: 'Not Specified',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(),
                      // hintText: 'Enter a search term',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              child: ElevatedButton(
                child: Text(
                  "Submit".tr,
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
                onPressed: () => submit(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submit() {
    // Navigator.of(context).pop(_textEditingController.text);
    Get.offAll(preferencelist());
    setState(() {
      whatareyoulooking = _textEditingController.text;
    });
  }
}
