import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Color detailMe = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(50),
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "Tap for details or double tap to hide details.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  detailMe = Colors.white;
                  setState(() {});
                },
                onDoubleTap: () {
                  detailMe = Colors.black;
                  setState(() {});
                },
                child: Container(
                  width: 280,
                  child: CircleAvatar(
                    radius: 140,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage("images/nico.jpg"),
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(25),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    color: detailMe),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Nama : Nathaniel Nico Sugiono',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'TTL : Jombang, 21 Juli 2000',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Phone : 082231487611',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Email : nathanielnicos@gmail.com',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
