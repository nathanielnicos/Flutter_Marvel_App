import 'package:flutter/material.dart';

class TimelineImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
            child: Image(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSze71bbTHTvjg17xypI3vU4YT8bVmNnYuyBQ&usqp=CAU'))),
      ),
    );
  }
}
