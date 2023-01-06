import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/loginpage.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:cc_avenue/cc_avenue.dart';

import 'main.dart';

// 3 months

class prime3m_package extends StatefulWidget {
  @override
  _prime3m_packageState createState() => _prime3m_packageState();
}

class _prime3m_packageState extends State<prime3m_package> {
  final _selectedSegment_04 = ValueNotifier('all');

  @override
  void initState() {
    // ray
    // _razorpay = Razorpay();
    // _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    imgdata3();

    super.initState();
  }

  var main_banner3;

  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      CcAvenue.cCAvenueInit(
          transUrl: 'https://secure.ccavenue.com/transaction/initTrans',
          accessCode: 'AVDE04JK49CJ84EDJC',
          amount: '10',
          cancelUrl:
              'https://sujithamatrimony.com/ccavenue/PHP/ccavResponseHandler.php',
          currencyType: 'INR',
          merchantId: '68141',
          orderId: '519',
          redirectUrl:
              'https://sujithamatrimony.com/ccavenue/PHP/ccavResponseHandler.php',
          rsaKeyUrl: 'https://secure.ccavenue.com/transaction/php/GetRSA.php');
    } on PlatformException {
      print('PlatformException');
    }
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        // height: _height / 2,
        child: Center(
          child: ValueListenableBuilder<String>(
            valueListenable: _selectedSegment_04,
            builder: (_, key, __) {
              return Container(
                child: main_banner3 != null
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: main_banner3.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 3.0,
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          main_banner3[index]['name'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: _width / 3.5,
                                        ),
                                        Text(
                                          main_banner3[index]['price'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.message_outlined),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: Text(main_banner3[index]
                                                  ['message']),
                                            ),
                                            // Text(
                                            //     'chat and make Video Calls.')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.mobile_friendly),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: Text(
                                                  main_banner3[index]['video']),
                                            ),
                                            // Text('numbers')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.workspace_premium_outlined),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: Text(main_banner3[index]
                                                  ['content']),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.orange,
                                              textStyle: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            initPlatformState();
                                          },
                                          // onPressed: () => payintegration(
                                          //     main_banner3[index]
                                          //         ['price'],
                                          //     main_banner3[index]['id']),
                                          child: const Text('Activate'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                    : Container(),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> imgdata3() async {
    var url = baselink + "get_subscription";

    var finalurl = Uri.parse(url);

    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    });
    print(res.body);

    var decodeValue = json.decode(res.body);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');
    var body = {
      'reg_id': regId,
    };
    setState(() {
      print(decodeValue['status']);
      main_banner3 = decodeValue['data']['premium']["3"];
      print(main_banner3.toString());
    });
  }
}

// 6 months

class prime6m_package extends StatefulWidget {
  @override
  _prime6m_packageState createState() => _prime6m_packageState();
}

class _prime6m_packageState extends State<prime6m_package> {
  final _selectedSegment_04 = ValueNotifier('all');

  @override
  void initState() {
    imgdata6();

    super.initState();
  }

  var main_banner6;

  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await CcAvenue.cCAvenueInit(
          transUrl: 'https://secure.ccavenue.com/transaction/initTrans',
          accessCode: '4YRUXLSRO20O8NIH',
          amount: '10',
          cancelUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
          currencyType: 'INR',
          merchantId: '2',
          orderId: '519',
          redirectUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
          rsaKeyUrl: 'https://secure.ccavenue.com/transaction/jsp/GetRSA.jsp');
    } catch (ex) {
      print('PlatformException${ex.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        // height: _height / 2,
        child: Center(
          child: ValueListenableBuilder<String>(
            valueListenable: _selectedSegment_04,
            builder: (_, key, __) {
              return Container(
                child: main_banner6 != null
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: main_banner6.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 3.0,
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          main_banner6[index]['name'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: _width / 3.5,
                                        ),
                                        Text(
                                          main_banner6[index]['price'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.message_outlined),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: Text(main_banner6[index]
                                                  ['message']),
                                            ),
                                            // Text(
                                            //     'chat and make Video Calls.')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.mobile_friendly),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: Text(
                                                  main_banner6[index]['video']),
                                            ),
                                            // Text('numbers')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.workspace_premium_outlined),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: Text(main_banner6[index]
                                                  ['content']),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.orange,
                                              textStyle: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            initPlatformState();
                                          },
                                          // onPressed: () => payintegration(
                                          //     main_banner3[index]
                                          //         ['price'],
                                          //     main_banner3[index]['id']),
                                          child: const Text('Activate'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                    : Container(),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> imgdata6() async {
    var url = baselink + "get_subscription";

    var finalurl = Uri.parse(url);

    var res = await http.post(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    });
    //  var decodeValue = json.decode(res.body);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');
    var body = {
      'reg_id': regId,
    };
    print(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {
      print(decodeValue['status']);
      main_banner6 = decodeValue['data']['premium']["6"];
      print(main_banner6.toString());
    });
  }

  // Future<void> payintegration(payamount, subid) async {
  //   var url =
  //       "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/get_razorpayorderid";
  //   // checker(context) async {
  //   var pref = await SharedPreferences.getInstance();
  //   var regid = pref.getString('regsId');
  //   //  pref.setString('customer_id', data['data']['customer_id'].toString())
  //   // final MyController con = Get.find();

  //   //  print(id);
  //   var finalurl = Uri.parse(url);
  //   var res = await http.post(finalurl, headers: <String, String>{
  //     'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
  //   }, body: {
  //     'pay_amount': payamount,
  //     'register_id': regid,
  //     'subscription_id': subid,
  //   });

  //   print('hi' + res.body);
  //   // var decodeValue = json.decode(res.body);
  //   var decodeValue = json.decode(res.body);
  //   setState(() {});
  //   if (decodeValue['status'] == true) {
  //     openCheckout(decodeValue['data']);
  //     // SharedPreferences pref = await SharedPreferences.getInstance();
  //     // pref.setString('temp_id', decodeValue['data']['user_temp_id'].toString());
  //     // Get.to(() => registration());

  //     // Fluttertoast.showToast(msg: decodeValue['message']);
  //   } else {
  //     Fluttertoast.showToast(msg: decodeValue['message']);
  //   }
  // }
}

// 12 months

class prime12m_package extends StatefulWidget {
  @override
  _prime12m_packageState createState() => _prime12m_packageState();
}

class _prime12m_packageState extends State<prime12m_package> {
  final _selectedSegment_04 = ValueNotifier('all');

  @override
  void initState() {
    imgdata12();

    super.initState();
  }

  var main_banner12;

  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await CcAvenue.cCAvenueInit(
          transUrl: 'https://sujithamatrimony.teckzy.co.in',
          accessCode: 'AVDE04JK49CJ84EDJC',
          amount: '10',
          cancelUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
          currencyType: 'INR',
          merchantId: '68141',
          orderId: '519',
          redirectUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
          rsaKeyUrl: 'https://secure.ccavenue.com/transaction/jsp/GetRSA.jsp');
    } catch (ex) {
      print('PlatformException${ex.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: _height / 1,
        child: Center(
          child: ValueListenableBuilder<String>(
            valueListenable: _selectedSegment_04,
            builder: (_, key, __) {
              return Container(
                child: main_banner12 != null
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: main_banner12.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 3.0,
                                    ),
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          main_banner12[index]['name'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: _width / 3.5,
                                        ),
                                        Text(
                                          main_banner12[index]['price'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.message_outlined),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: Text(main_banner12[index]
                                                  ['message']),
                                            ),
                                            // Text(
                                            //     'chat and make Video Calls.')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.mobile_friendly),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: Text(main_banner12[index]
                                                  ['video']),
                                            ),
                                            // Text('numbers')
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(Icons.workspace_premium_outlined),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              child: Text(main_banner12[index]
                                                  ['content']),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.orange,
                                              textStyle: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            initPlatformState();
                                          },
                                          // onPressed: () => payintegration(
                                          //     main_banner3[index]
                                          //         ['price'],
                                          //     main_banner3[index]['id']),
                                          child: const Text('Activate'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                    : Container(),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> imgdata12() async {
    var url = baselink + "get_subscription";

    var finalurl = Uri.parse(url);

    //  var decodeValue = json.decode(res.body);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var regId = pref.getString('regsId');
    var body = {
      'reg_id': regId,
    };
    var res = await http.post(finalurl,
        headers: <String, String>{
          'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
        },
        body: body);
    var decodeValue = json.decode(res.body);
    setState(() {
      print(decodeValue['status']);
      main_banner12 = decodeValue['data']['premium']["12"];
      print(main_banner12.toString());
    });
  }
}
