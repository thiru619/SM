import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

double height_ = 0;
double width_ = 0;
var size;

class gradientclr {
  Decoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[
          Color.fromARGB(255, 104, 231, 106),
          Color.fromARGB(255, 37, 131, 44),
          Color.fromARGB(255, 78, 207, 143),
        ],
      ),
    );
  }

  dialogFunction(BuildContext context) {
    var selectedValue15 = [];
    final List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
      'Item5',
      'Item6',
      'Item7',
      'Item8',
    ];
    String? selectedValue;
    return showDialog(
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setState) {
        return SingleChildScrollView(
          child: Container(
            child: AlertDialog(
              // title: Text("Filter"),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: 50,
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Row(
                              children: const [
                                Icon(
                                  Icons.list,
                                  size: 16,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Select Item',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                              });
                            },
                          ),
                        ),
                        Row(children: [
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 70,
                            child: ElevatedButton(
                              child: Text('Close'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 70,
                            child: ElevatedButton(
                              child: Text('Open'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ])
                      ]),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

mediaSize(BuildContext context) {
  size = MediaQuery.of(context).size;
  height_ = size.height;
  width_ = size.width;
}
