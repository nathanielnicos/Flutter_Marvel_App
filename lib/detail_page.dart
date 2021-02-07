import 'package:flutter/material.dart';
import 'package:my_marvel_app/mcu_data.dart';

class DetailPage extends StatelessWidget {
  final McuData place;

  DetailPage({@required this.place});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(125),
                child: Container(
                  width: 250,
                  child: Image(
                    image: NetworkImage(place.imageUrls),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    Text(
                      place.real,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'A.K.A. ${place.name}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Pemeran: ${place.art}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
