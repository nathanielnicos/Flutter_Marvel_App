import 'package:flutter/material.dart';
import 'package:my_marvel_app/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Cinematic Universe',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
