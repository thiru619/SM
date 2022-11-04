import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:sujithamatrimony/homescreen.dart';
import 'package:sujithamatrimony/idverification.dart';
import 'package:sujithamatrimony/loginpage.dart';
import 'package:sujithamatrimony/packages.dart';
import 'package:sujithamatrimony/preferencelist.dart';
import 'package:sujithamatrimony/referralcode.dart';
import 'package:sujithamatrimony/settings.dart';
import 'package:sujithamatrimony/weddingservices.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:sujithamatrimony/languagecontroler.dart';
import 'package:sujithamatrimony/preferencelist.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'package:image_cropper/image_cropper.dart';

class photo_upload extends StatefulWidget {
  const photo_upload({Key? key}) : super(key: key);

  @override
  State<photo_upload> createState() => _photo_uploadState();
}

class _photo_uploadState extends State<photo_upload> {
  @override
  final padding = EdgeInsets.symmetric(horizontal: 20);
  TextEditingController ImagePickerController = TextEditingController();

  CroppedFile? _croppedFile;

  File? _image;
  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(
      source: source,
      imageQuality: 100,
    );
    if (image == null) return;
    // final imageTemporary = File(image.path);
    await _cropImage(image.path);
  }

  Future<Null> _cropImage(String? imagespath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagespath.toString(),
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
        ),
      ],
    );
    setState(() {
      Get.back();
      _image = File(croppedFile!.path);
      // ImagePickerController.text = croppedFile.path;
      print(_image!.path);
    });
  }

  var new_pic = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => preferencelist()),
                  );
                },
                child: Text(
                  'Skip > ',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      // Container(
      //   height: 60,
      //   color: Color(0xFF947BF5),
      // ),

      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              // width: 288,

              // decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  _image == null
                      ? CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.blue,
                          backgroundImage: AssetImage(
                            'assets/profile.png',
                          ),
                        )
                      : ClipOval(
                          child: Image.file(_image!,
                              height: 105, width: 105, fit: BoxFit.cover)),
                  Positioned(
                    child: InkWell(
                      child: Icon(Icons.camera_alt),
                      onTap: () {
                        Get.bottomSheet(
                          Container(
                            // width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white54,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                )),
                            // padding: EdgeInsets.only(
                            //     left: 90, top: 12, bottom: 12, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Image(
                                  image: AssetImage(
                                    'assets/sujithalogo.png',
                                  ),
                                  width: 150,
                                  height: 150,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepOrangeAccent,
                                      ),
                                      onPressed: () =>
                                          getImage(ImageSource.gallery),
                                      // color: Color.fromARGB(255, 255, 115, 0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.image_outlined,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 15),
                                          Text('Gallery',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(width: 0),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepOrangeAccent,
                                      ),
                                      onPressed: () =>
                                          getImage(ImageSource.camera),
                                      // color: Color.fromARGB(255, 255, 115, 0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.camera_alt_outlined,
                                              color: Colors.white),
                                          SizedBox(width: 15),
                                          Text('Camera',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 150,
              height: 40,
              child: ElevatedButton(
                child: Text(
                  "submit".tr,
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
                onPressed: () {
                  print(_image);
                  if (_image == null) {
                    Fluttertoast.showToast(msg: 'upload photo');
                  } else {
                    profile_pic();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> profile_pic() async {
    var baseurl =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/update_profile_pic";
    final uri = Uri.parse(baseurl);
    var request = http.MultipartRequest('POST', uri);

    request.headers.addAll(
      {
        "Content-type": "application/x-www-form-urlencoded",
        'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
      },
    );
    var pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');
    request.fields['reg_id'] = regId.toString();

    print(regId);
    var firstimage;
    //  SharedPreferences pref = await SharedPreferences.getInstance();

    if (_image != null) {
      firstimage =
          await http.MultipartFile.fromPath('profile_image', _image!.path);
      request.files.add(firstimage);
    }
    //     await http.MultipartFile.fromPath('profile_image', _image!.path);
    // request.files.add(firstimage);

    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    var data = json.decode(respStr);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const preferencelist()),
    );
  }
}
