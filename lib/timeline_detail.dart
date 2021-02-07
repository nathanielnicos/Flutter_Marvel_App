import 'package:flutter/material.dart';
import 'package:my_marvel_app/timeline_data.dart';

class TimelineDetail extends StatelessWidget {
  final TimelineData place;

  TimelineDetail({@required this.place});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Year : " + place.year),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: NetworkImage(place.imageUrls),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
