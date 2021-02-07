import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_marvel_app/detail_page.dart';
import 'package:my_marvel_app/mcu_char.dart';
import 'package:my_marvel_app/about_page.dart';
import 'package:my_marvel_app/timeline_image.dart';
import 'package:my_marvel_app/timeline_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isNight = true;
  Color colorBg = Colors.black;
  Color colorTxt = Colors.white;

  @override
  Widget build(BuildContext context) {
    Widget _listTile(
        IconData iconListTile, String textListTile, Object otherPage) {
      return ListTile(
        leading: Icon(iconListTile),
        title: Text(textListTile),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return otherPage;
          }));
        },
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/nico.jpg'),
                  ),
                  accountName: Text(
                    'Nathaniel Nico Sugiono',
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text(
                    'nathanielnicos@gmail.com',
                    style: TextStyle(fontSize: 15),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  onDetailsPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AboutPage();
                    }));
                  },
                ),
                _listTile(Icons.local_movies, "MCU Timeline", TimelinePage()),
                Divider(
                  height: 15,
                ),
                _listTile(Icons.timeline, "Timeline Image", TimelineImage()),
                Divider(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Text(
            'MARVEL CINEMATIC UNIVERSE',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.5,
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(isNight ? Icons.brightness_3 : Icons.brightness_7),
                onPressed: () {
                  if (isNight == true) {
                    colorBg = Colors.white;
                    colorTxt = Colors.black;
                  } else {
                    colorBg = Colors.black;
                    colorTxt = Colors.white;
                  }
                  setState(() {
                    isNight = !isNight;
                  });
                })
          ],
        ),
        backgroundColor: colorBg,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: mcuData.map((place) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailPage(place: place);
                        }));
                      },
                      child: Container(
                        height: 120,
                        margin: EdgeInsets.all(10),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(place.imageUrls),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(12),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      color: colorBg,
                      child: Text(
                        'Marvel Cinematic Universe (MCU) adalah media waralaba Amerika Serikat yang berpusat pada serangkaian film pahlawan super, yang diproduksi secara mandiri oleh Marvel Studios, dan yang didasarkan pada karakter-karakter yang muncul dalam buku komik Amerika terbitan Marvel Comics.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, color: colorTxt),
                      ),
                    ),
                    _titleCard("ON GOING MCU"),
                    _cardContent(
                        Colors.lightGreen,
                        'https://upload.wikimedia.org/wikipedia/pt/thumb/f/f2/Agents_of_S.H.I.E.L.D._season_7_poster.jpg/230px-Agents_of_S.H.I.E.L.D._season_7_poster.jpg',
                        'Agents of S.H.I.E.L.D. Season 7',
                        'Starring: Clark Gregg, Ming-Na Wen, Chloe Bennet, Elizabeth Henstridge, Henry Simmons, Natalia Cordova-Buckley, Jeff Ward, Iain De Caestecker',
                        'Original Release: May 27, 2020'),
                    _cardContent(
                        Colors.lightBlue,
                        'https://upload.wikimedia.org/wikipedia/en/7/74/Black_Widow_poster.jpg',
                        'Black Widow',
                        'Starring: Scarlett Johansson, David Harbour, Florence Pugh, O-T Fagbenle, Rachel Weisz',
                        'Original Release: Nov 6, 2020'),
                    _titleCard("FILM MARVEL BUKAN MCU"),
                    _cardContent(
                        Colors.deepPurple[200],
                        'https://upload.wikimedia.org/wikipedia/en/1/1a/TheNewMutantsPoster.jpeg',
                        'The New Mutants',
                        'Starring: Anya Taylor-Joy, Maisie Williams, Charlie Heaton, Henry Zaga, Blu Hunt, Alice Braga',
                        'Original Release: Aug 28, 2020'),
                    _titleCard("TV SERIES MCU"),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image(
                        image: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/id/3/39/AoSAgentCarterPoster.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _cardContent(
    Color cardColor, String netImg, String title, String star, String release) {
  return Card(
    color: cardColor,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Image.network(netImg),
        ),
        Flexible(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 15.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  star,
                  style: TextStyle(fontSize: 13.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  release,
                  style: TextStyle(fontSize: 13.0),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _titleCard(String text) {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: Colors.amber, borderRadius: BorderRadius.circular(14)),
    height: 28,
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 15, color: Colors.black, fontWeight: FontWeight.w700),
    ),
  );
}
