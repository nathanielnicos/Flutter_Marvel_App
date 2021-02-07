import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_marvel_app/timeline_detail.dart';
import 'timeline_detail.dart';
import 'package:my_marvel_app/mcu_film.dart';

class TimelinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:
            AppBar(title: Text('MCU TIMELINE'), backgroundColor: Colors.red),
        backgroundColor: Colors.black,
        body: ListView(
          children: timelineList.map((place) {
            return FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TimelineDetail(place: place);
                }));
              },
              child: Card(
                color: Colors.grey[200],
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.network(place.imageUrls),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(place.title),
                            SizedBox(
                              height: 10,
                            ),
                            Text(place.star),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
