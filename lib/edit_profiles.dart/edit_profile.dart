import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/colors.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:sujithamatrimony/edit_profiles.dart/edit_contact.dart';
import 'package:sujithamatrimony/edit_profiles.dart/family_detail.dart';
import 'package:sujithamatrimony/edit_profiles.dart/location_detail.dart';
import 'package:sujithamatrimony/edit_profiles.dart/religion_detail.dart';
import 'package:sujithamatrimony/loginpage.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:http/http.dart' as http;
import '../languagecontroler.dart';
import 'Professionalinfo_detail.dart';
import 'basic_detail.dart';
import 'package:image_cropper/image_cropper.dart';

var firstimage;

var baseurl =
    'http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/';

var adddetials = '';
final TextEditingController _namefields = TextEditingController();

class Edit_profile extends StatefulWidget {
  const Edit_profile({Key? key}) : super(key: key);

  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  gradientclr crl = gradientclr();

  int id = 1;
  var selectedValue15 = [];
  var viewdetails;
  bool loading = false;

  var height = [];
  var heightlist = [];
  var maritialstatusList = [];
  var maritialstatus = [];
  var physicalstatus = [];
  var physicalstatuslist = [];
  var mothertongue = [];
  var mothertonguelist = [];
  var profilecreatedfor = [];
  var profilecreatedforlist = [];
  var eating_habits = [];
  var eating_habitsList = [];
  var drinking_habits = [];
  var drinking_habitsList = [];
  var smoking_habits = [];
  var smoking_habitsList = [];
  var cityList = [];
  var cityList1 = [];
  var stateList = [];
  var stateList1 = [];
  var casteList = [];
  var countryList = [];
  var familyvaluelist = [];
  var annualincomelist = [];
  var familystatuslist = [];
  var religionslist = [];
  var annualincome = [];
  var familystatus = [];
  var familyvalue = [];
  var religions = [];
  var country = [];
  var employedinlist = [];
  var occupationcategorylist = [];
  var occupationcategory = [];
  var employedin = [];
  var educationslist = [];
  var educations = [];

  List<String> strs15 = [];
  List<String> strs = [];
  List<String> strs1 = [];
  List<String> strs2 = [];
  List<String> strs6 = [];
  List<String> strs3 = [];
  List<String> strs7 = [];
  List<String> strs29 = [];
  List<String> strs30 = [];
  List<String> strs31 = [];
  List<String> strs23 = [];
  List<String> strs22 = [];
  List<String> strs21 = [];
  List<String> strs14 = [];
  List<String> strs11 = [];
  List<String> strs12 = [];
  List<String> strs13 = [];
  List<String> strs10 = [];
  List<String> strs8 = [];

  @override
  void initState() {
    // getData();
    // getData1();
    viewprofile();
    profile_pic();
    super.initState();
  }

  CroppedFile? _croppedFile;

  File? _image;
  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(
      source: source,
      imageQuality: 100,
    );
    if (image == null) return;
    // final imageTemporary = File(image.path);
    if (image.path != null) {
      await _cropImage(image.path);
    }
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
    if (_image != null) {
      profile_pic();
    }
  }

  @override
  Widget build(BuildContext context) {
    return viewdetails != null
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text('EDIT PROFILE'),
              flexibleSpace: Container(
                decoration: crl.Decoration(),
              ),
            ),
            body: !loading
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
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
                          child: Container(
                            height: 350,
                            width: MediaQuery.of(context).size.width / 1,
                            decoration: BoxDecoration(
                                image: _image?.path == null
                                    ? DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            viewdetails['basic_details']
                                                    ['profile_image']
                                                .toString()))
                                    : DecorationImage(
                                        fit: BoxFit.fill,
                                        image: FileImage(_image!))
                                // color: Colors.grey,
                                ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'PROFILE COMPLETENESS',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.greenAccent),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 30,
                                        child: LiquidLinearProgressIndicator(
                                          value: double.parse(
                                              "0.${int.parse(viewdetails['basic_details']['profile_percentage'].toString())}"), // Defaults to 0.5.
                                          valueColor: AlwaysStoppedAnimation(Colors
                                              .blue), // Defaults to the current Theme's accentColor.
                                          backgroundColor: Colors
                                              .white, // Defaults to the current Theme's backgroundColor.
                                          borderColor: Colors.transparent,
                                          borderWidth: 5.0,
                                          borderRadius: 12.0,
                                          direction: Axis
                                              .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                                          center: Text(
                                            "${viewdetails['basic_details']['profile_percentage'].toString()}%",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'PERSONAL INFORMATION',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Few words about her',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30, left: 30),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null, minLines: 5,
                            initialValue: 'Not Specified',
                            // maxLength: 20,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 114, 113, 113)),
                              ),
                              // icon: Icon(Icons.favorite),
                              labelText: "Comments",
                              labelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Basic Detail',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Get more responses by verifying'),
                                  Text('your name and age'),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                // width: 150,
                                // height: 40,
                                child: ElevatedButton(
                                  child: Text(
                                    "Verify your profile  >",
                                    // style: TextStyle(fontSize: 20),
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
                                          color:
                                              Color.fromARGB(255, 255, 111, 0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) => bottomsheet()),
                                    // );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              iconSize: 18,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => basic_detail()),
                                );
                              },
                              icon: Icon(Icons.edit),
                              color: Colors.orange,
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Name'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Age'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Height'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Weight'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Marital Status'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Mother Tongue'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Physical Status'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Body Type'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Profile Created by'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Eating Habits'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Drinking Habits'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Smoking Habits'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  viewdetails['basic_details']['name'] == ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['basic_details']['name'],
                                        ),
                                  // style: TextStyle(color: Colors.orange),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  viewdetails['basic_details']['age'] == ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['basic_details']['age'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  viewdetails['basic_details']['height'] == ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['basic_details']
                                              ['height'],
                                          // style: TextStyle(color: Colors.orange),
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  InkWell(
                                      onTap: () {},
                                      child: viewdetails['basic_details']
                                                  ['weight'] ==
                                              ''
                                          ? Text(
                                              '+ Add Details',
                                              style: TextStyle(
                                                  color: Colors.orange),
                                            )
                                          : Text(
                                              viewdetails['basic_details']
                                                  ['weight'],

                                              // style: TextStyle(color: Colors.orange),

                                              // style: TextStyle(color: Colors.orange),
                                            )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['basic_details']
                                              ['maritial_status'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['basic_details']
                                              ['maritial_status'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  viewdetails['basic_details']
                                              ['mother_tongue'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['basic_details']
                                              ['mother_tongue'],

                                          // style: TextStyle(color: Colors.orange),
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  viewdetails['basic_details']
                                              ['physical_status'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['basic_details']
                                              ['physical_status'],
                                        ),
                                  // style: TextStyle(color: Colors.orange),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['basic_details']['body_type'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['basic_details']
                                              ['body_type'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['basic_details']
                                              ['profile_created_by'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['basic_details']
                                              ['profile_created_by'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['basic_details']
                                              ['eating_habits'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['basic_details']
                                              ['eating_habits'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () async {},
                                    child: viewdetails['basic_details']
                                                ['drinking_habits'] ==
                                            ''
                                        ? Text(
                                            '+ Add Details',
                                            style:
                                                TextStyle(color: Colors.orange),
                                          )
                                        : Text(
                                            viewdetails['basic_details']
                                                ['drinking_habits'],
                                          ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['basic_details']
                                              ['smoking_habits'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['basic_details']
                                              ['smoking_habits'],
                                        ),
                                ],
                              )),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.note_outlined,
                                    color: Color.fromARGB(255, 30, 191, 219),
                                  )),
                              Text(
                                'Religious Information',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              IconButton(
                                iconSize: 18,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            religion_detail()),
                                  );
                                },
                                icon: Icon(Icons.edit),
                                color: Colors.orange,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Religon'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Caste'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Sub Caste'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Zodiac'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Star'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Rassi'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Dhosam'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ])),
                              SizedBox(
                                width: 80,
                              ),
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  viewdetails['religious_details']
                                              ['religion'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['religious_details']
                                              ['religion'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['religious_details']['caste'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['religious_details']
                                              ['caste'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['religious_details']
                                              ['sub_caste'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['religious_details']
                                              ['sub_caste'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['religious_details']['zodiac'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['religious_details']
                                              ['zodiac'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['religious_details']['star'] == ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['religious_details']
                                              ['star'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['religious_details']['raasi'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['religious_details']
                                              ['raasi'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['religious_details']['dosham'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['religious_details']
                                              ['dosham'],
                                        ),
                                ],
                              )),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.cast_for_education_rounded,
                                    color: Color.fromARGB(255, 30, 96, 219),
                                  )),
                              Text(
                                'Professional Information',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 75,
                              ),
                              IconButton(
                                iconSize: 18,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            professionalinfo_detail()),
                                  );
                                },
                                icon: Icon(Icons.edit),
                                color: Colors.orange,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Education Category'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('College / Institution'),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Text('Occupation'),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Text('Organization'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Employed in'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Annual Income'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ])),
                              SizedBox(
                                width: 80,
                              ),
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  viewdetails['professional_details']
                                              ['education'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['professional_details']
                                              ['education'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['professional_details']
                                              ['college'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['professional_details']
                                              ['college'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['professional_details']
                                              ['occupation'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : SizedBox(
                                          width: 140,
                                          child: Text(
                                            viewdetails['professional_details']
                                                ['occupation'],
                                          ),
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['professional_details']
                                              ['organization'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['professional_details']
                                              ['organization'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['professional_details']
                                              ['employed_in'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['professional_details']
                                              ['employed_in'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['professional_details']
                                              ['annual_income'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['professional_details']
                                              ['annual_income'],
                                        ),
                                ],
                              )),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.location_on,
                                    color: Color.fromARGB(255, 223, 144, 243),
                                  )),
                              Text(
                                'Location',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 140,
                              ),
                              IconButton(
                                iconSize: 18,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            location_detail()),
                                  );
                                },
                                icon: Icon(Icons.edit),
                                color: Colors.orange,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Country'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('State'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('City'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Citizenship'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Ancestral Orgin'),
                                  ])),
                              SizedBox(
                                width: 130,
                              ),
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['location_details']['country'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['location_details']
                                              ['country'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['location_details']['state'] == ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['location_details']
                                              ['state'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['location_details']['city'] == ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['location_details']
                                              ['city'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['location_details']
                                              ['citizenship'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['location_details']
                                              ['citizenship'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['location_details']
                                              ['ancestral_orgin'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['location_details']
                                              ['ancestral_orgin'],
                                        ),
                                ],
                              )),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.family_restroom_outlined,
                                    color: Color.fromARGB(255, 145, 164, 199),
                                  )),
                              Text(
                                'Family Details',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              IconButton(
                                iconSize: 18,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => family_detail()),
                                  );
                                },
                                icon: Icon(Icons.edit),
                                color: Colors.orange,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Family Values"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Family Type"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Family Status"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Father's Occupation"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Mother's Occupation"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Brother(s)'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Brother(s) Married'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Sister(s)'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text('Sister(s) Married'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ])),
                              SizedBox(
                                width: 100,
                              ),
                              Container(
                                  child: Column(
                                children: [
                                  viewdetails['family_details']
                                              ['family_values'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['family_details']
                                              ['family_values'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['family_details']
                                              ['family_type'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['family_details']
                                              ['family_type'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['family_details']
                                              ['family_status'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['family_details']
                                              ['family_status'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['family_details']
                                              ['father_occupation'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['family_details']
                                              ['father_occupation'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['family_details']
                                              ['mother_occupation'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['family_details']
                                              ['mother_occupation'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['family_details']['brothers'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['family_details']
                                              ['brothers'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['family_details']
                                              ['brothers_married'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['family_details']
                                              ['brothers_married'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['family_details']['sisters'] == ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['family_details']
                                              ['sisters'],
                                        ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  viewdetails['family_details']
                                              ['sisters_married'] ==
                                          ''
                                      ? Text(
                                          '+ Add Details',
                                          style:
                                              TextStyle(color: Colors.orange),
                                        )
                                      : Text(
                                          viewdetails['family_details']
                                              ['sisters_married'],
                                        ),
                                ],
                              )),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.note_outlined,
                                    color: Color.fromARGB(255, 184, 74, 23),
                                  )),
                              Text(
                                'About Family',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30, left: 30),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,

                            initialValue: viewdetails['family_details']
                                        ['about_my_family'] ==
                                    ''
                                ? 'Not Specified'
                                : viewdetails['family_details']
                                    ['about_my_family'],
                            // maxLength: 20,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 114, 113, 113)),
                              ),
                              // icon: Icon(Icons.favorite),
                              labelText: "Comments",
                              labelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.note_outlined,
                                    color: Color.fromARGB(255, 184, 74, 23),
                                  )),
                              Text(
                                'In My Own Words',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30, left: 30),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,

                            initialValue: 'Not Specified',
                            // maxLength: 20,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(bottom: 40),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 114, 113, 113)),
                              ),
                              // icon: Icon(Icons.favorite),
                              // labelText: "Comments",
                              labelStyle:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Image(image: AssetImage('assets/couple.jpg')),
                        SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  )
                : Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ))
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }

  Future<void> viewprofile() async {
    setState(() {
      loading = true;
    });
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/get_view_profile";
    // checker(context) async {
    var pref = await SharedPreferences.getInstance();
    var regid = pref.getString('regsId');

    //  pref.setString('customer_id', data['data']['customer_id'].toString())
    // final MyController con = Get.find();

    //  print(id);
    var finalurl = Uri.parse(url);
    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    }, body: {
      'reg_id': regid,
    });

    print('hi' + res.body);
    // var decodeValue = json.decode(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {});
    if (decodeValue['status'] == true) {
      viewdetails = decodeValue['data'];
      print(viewdetails);
      // SharedPreferences pref = await SharedPreferences.getInstance();
      // pref.setString('temp_id', decodeValue['data']['user_temp_id'].toString());
      // Get.to(() => registration());

      // Fluttertoast.showToast(msg: decodeValue['message']);
    } else {
      Fluttertoast.showToast(msg: decodeValue['message']);
    }
    setState(() {
      loading = false;
    });
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
    setState(() {});
  }
}
