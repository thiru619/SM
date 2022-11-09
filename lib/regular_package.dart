import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sujithamatrimony/loginpage.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:cc_avenue/cc_avenue.dart';
// 3 months

class regular3m_package extends StatefulWidget {
  @override
  _regular3m_packageState createState() => _regular3m_packageState();
}

class _regular3m_packageState extends State<regular3m_package> {
  final _selectedSegment_04 = ValueNotifier('all');

  @override
  void initState() {
    imgdata3();
    // ray

    super.initState();
  }

  var main_banner3;

  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await CcAvenue.cCAvenueInit(
          transUrl: 'https://secure.ccavenue.com/transaction/initTrans',
          accessCode: 'AVQO05CF40BJ62OQJB	 ',
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
        height: _height / 2,
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
                          return Container(
                            margin: EdgeInsets.only(right: 15),
                            width: _width / 1.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => newreleases()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          new BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 3.0,
                                          ),
                                        ]),
                                    // color: Colors.white,
                                    // height: _height / 0.9,
                                    width: _width / 1.6,
                                    // child: Image.network(
                                    //   new_profile[index]
                                    //           ['profile_image']
                                    //       .toString(),
                                    //   fit: BoxFit.fill,
                                    // )
                                    // Image.asset("images/new_image.jpg",fit: BoxFit.fill,)
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    main_banner3[index]['name'],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                    main_banner3[index]
                                                        ['price'],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Icon(
                                                        Icons.message_outlined),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          width: 170,
                                                          child: Text(
                                                              main_banner3[
                                                                      index]
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 170,
                                                          child: Text(
                                                              main_banner3[
                                                                      index]
                                                                  ['video']),
                                                        ),
                                                        // Text('numbers')
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Icon(Icons
                                                        .workspace_premium_outlined),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          width: 170,
                                                          child: Text(
                                                              main_banner3[
                                                                      index]
                                                                  ['content']),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
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
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                onPressed: () {
                                                  initPlatformState();
                                                },
                                                // onPressed: () => payintegration(
                                                //     main_banner3[index]
                                                //         ['price'],
                                                //     main_banner3[index]['id']),
                                                child: const Text('Pay Now'),
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
                                ),
                              ],
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
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/get_subscription";

    var finalurl = Uri.parse(url);

    var res = await http.get(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    });
    print(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {
      print(decodeValue['status']);
      main_banner3 = decodeValue['data']['regular']["3"];
      print(main_banner3.toString());
    });
  }
}

// 6 months

class regular6m_package extends StatefulWidget {
  @override
  _regular6m_packageState createState() => _regular6m_packageState();
}

class _regular6m_packageState extends State<regular6m_package> {
  final _selectedSegment_04 = ValueNotifier('all');

  @override
  void initState() {
    imgdata6();
    // ray

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
        height: _height / 2,
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
                          return Container(
                            margin: EdgeInsets.only(right: 15),
                            width: _width / 1.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => newreleases()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          new BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 3.0,
                                          ),
                                        ]),
                                    // height: _height / 4.66,
                                    width: _width / 1.6,
                                    // child: Image.network(
                                    //   new_profile[index]
                                    //           ['profile_image']
                                    //       .toString(),
                                    //   fit: BoxFit.fill,
                                    // )
                                    // Image.asset("images/new_image.jpg",fit: BoxFit.fill,)
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    main_banner6[index]['name'],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                    main_banner6[index]
                                                        ['price'],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Icon(
                                                        Icons.message_outlined),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          width: 170,
                                                          child: Text(
                                                              main_banner6[
                                                                      index]
                                                                  ['message']),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 170,
                                                          child: Text(
                                                              main_banner6[
                                                                      index]
                                                                  ['video']),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Icon(Icons
                                                        .workspace_premium_outlined),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          width: 170,
                                                          child: Text(
                                                              main_banner6[
                                                                      index]
                                                                  ['content']),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
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
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                onPressed: () {
                                                  initPlatformState();
                                                },
                                                // onPressed: () => payintegration(
                                                //     main_banner6[index]
                                                //         ['price'],
                                                //     main_banner6[index]['id']),
                                                child: const Text('Pay Now'),
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
                                ),
                              ],
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
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/get_subscription";

    var finalurl = Uri.parse(url);

    var res = await http.get(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    });
    print(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {
      print(decodeValue['status']);
      main_banner6 = decodeValue['data']['regular']["6"];
      print(main_banner6.toString());
    });
  }
}

// 12 months

class regular12m_package extends StatefulWidget {
  @override
  _regular12m_packageState createState() => _regular12m_packageState();
}

class _regular12m_packageState extends State<regular12m_package> {
  final _selectedSegment_04 = ValueNotifier('all');

  @override
  void initState() {
    imgdata12();
    // ray

    super.initState();
  }

  var main_banner12;

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
                          return Container(
                            margin: EdgeInsets.only(right: 15),
                            width: _width / 1.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Navigator.of(context).push(MaterialPageRoute(
                                    //     builder: (context) => newreleases()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          new BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 3.0,
                                          ),
                                        ]),
                                    // height: _height / 4.66,
                                    width: _width / 1.6,
                                    // child: Image.network(
                                    //   new_profile[index]
                                    //           ['profile_image']
                                    //       .toString(),
                                    //   fit: BoxFit.fill,
                                    // )
                                    // Image.asset("images/new_image.jpg",fit: BoxFit.fill,)
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    main_banner12[index]
                                                        ['name'],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  Text(
                                                    main_banner12[index]
                                                        ['price'],
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Icon(
                                                        Icons.message_outlined),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          width: 170,
                                                          child: Text(
                                                              main_banner12[
                                                                      index]
                                                                  ['message']),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 170,
                                                          child: Text(
                                                              main_banner12[
                                                                      index]
                                                                  ['video']),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Icon(Icons
                                                        .workspace_premium_outlined),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          width: 170,
                                                          child: Text(
                                                              main_banner12[
                                                                      index]
                                                                  ['content']),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
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
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                onPressed: () {
                                                  initPlatformState();
                                                },
                                                // onPressed: () => payintegration(
                                                //     main_banner12[index]
                                                //         ['price'],
                                                //     main_banner12[index]['id']),
                                                child: const Text('Pay Now'),
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
                                ),
                              ],
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
    var url =
        "http://sujithamatrimony.teckzy.co.in/sujitha_matrimony_api/restapi/UserApi/get_subscription";

    var finalurl = Uri.parse(url);

    var res = await http.get(finalurl, headers: <String, String>{
      'X-API-KEY': '50f58d4facbdfe506d51ad6b079deaae'
    });
    print(res.body);
    var decodeValue = json.decode(res.body);
    setState(() {
      print(decodeValue['status']);
      main_banner12 = decodeValue['data']['regular']["6"];
      print(main_banner12.toString());
    });
  }
}
