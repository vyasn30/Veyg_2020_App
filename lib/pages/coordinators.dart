import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Coordinators extends StatefulWidget {
  @override
  _CoordinatorsState createState() => _CoordinatorsState();
}

class _CoordinatorsState extends State<Coordinators> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF000000),
              const Color(0xFF323232),
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              leading: IconButton(
                icon: Icon(FontAwesomeIcons.arrowLeft),
                iconSize: 30,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              automaticallyImplyLeading: false,
              elevation: 10,
              expandedHeight: 350.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.all(15),
                title: Text(
                  "Coordinators",
                  style: GoogleFonts.comfortaa(
                      textStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                ),
                background: Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.scaleDown,
                ),
              ),
              backgroundColor: Colors.transparent,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  _divider(),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Column(children: <Widget>[
                      _buidProfile(
                          "https://shahharsh77.github.io/VEYG/Sub/Events/events'19_files/matty-lynn-barnes-kX-N8JQ7CAg-unsplash.jpg",
                          "Hiren Vadher"),
                      SizedBox(
                        height: 20,
                      ),
                      _buidProfile(
                          "https://shahharsh77.github.io/VEYG/Sub/img/team/jj.png",
                          "Hiren Vadher"),
                      SizedBox(
                        height: 20,
                      ),
                      _buidProfile(
                          "https://shahharsh77.github.io/VEYG/Sub/Events/events'19_files/matty-lynn-barnes-kX-N8JQ7CAg-unsplash.jpg",
                          "Hiren Vadher"),
                      SizedBox(
                        height: 20,
                      ),
                      _buidProfile(
                          "https://shahharsh77.github.io/VEYG/Sub/Events/events'19_files/matty-lynn-barnes-kX-N8JQ7CAg-unsplash.jpg",
                          "Hiren Vadher"),
                      SizedBox(
                        height: 20,
                      ),
                      _buidProfile(
                          "https://shahharsh77.github.io/VEYG/Sub/Events/events'19_files/matty-lynn-barnes-kX-N8JQ7CAg-unsplash.jpg",
                          "Hiren Vadher"),
                    ]),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    //     color: _cardBgColor),
                    // SizedBox(height: 5),
                    // _inroduction(),
                    // SizedBox(height: 5),
                    // _bulletList("Rules", event.rules),
                    // SizedBox(height: 5),
                    // _bulletList("Faculty", event.faculty),
                    // SizedBox(height: 5),
                    // _bulletList("Student Coordinator", event.studentCoord),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  _divider() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Row(children: <Widget>[
        Expanded(
            child: Divider(
          color: Colors.white,
          thickness: 1.2,
        )),
      ]),
    );
  }

  _buidProfile(String url, String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(url),
          backgroundColor: Colors.black,
          radius: 35,
          child: ClipOval(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                "url",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
