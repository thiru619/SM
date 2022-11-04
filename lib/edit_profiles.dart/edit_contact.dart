import 'package:flutter/material.dart';
import 'package:sujithamatrimony/colors.dart';

class Edit_contact extends StatefulWidget {
  const Edit_contact({Key? key}) : super(key: key);

  @override
  State<Edit_contact> createState() => _Edit_contactState();
}

class _Edit_contactState extends State<Edit_contact> {
  gradientclr crl = gradientclr();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('EDIT CONTACT INFO'),
        flexibleSpace: Container(
          decoration: crl.Decoration(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                'Email',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                // maxLength: 20,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 114, 113, 113)),
                  ),
                  // icon: Icon(Icons.favorite),
                  labelText: 'Current E-Mail address',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                'PHONE NUMBER',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                // maxLength: 20,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 114, 113, 113)),
                  ),
                  // icon: Icon(Icons.favorite),
                  labelText: 'Primay Contact Details',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                // maxLength: 20,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 114, 113, 113)),
                  ),
                  // icon: Icon(Icons.favorite),
                  labelText: 'Alternate Contact Details',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                'CONTACT PREFERENCE',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                initialValue: 'Not Specified',
                // maxLength: 20,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 114, 113, 113)),
                  ),
                  // icon: Icon(Icons.favorite),
                  labelText: 'Whom to contact',
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                initialValue: 'Not Specified',
                // maxLength: 20,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 114, 113, 113)),
                  ),
                  // icon: Icon(Icons.favorite),
                  labelText: "Contact Person's Name",
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                initialValue: 'Not Specified',
                // maxLength: 20,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 114, 113, 113)),
                  ),
                  // icon: Icon(Icons.favorite),
                  labelText: "Available time to call",
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                initialValue: 'Not Specified',
                // maxLength: 20,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 114, 113, 113)),
                  ),
                  // icon: Icon(Icons.favorite),
                  labelText: "Comments",
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
