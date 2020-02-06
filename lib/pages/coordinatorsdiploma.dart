import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CoordinatorsDiploma extends StatefulWidget {
  @override
  _CoordinatorsState createState() => _CoordinatorsState();
}

const Color _cardBgColor = Color(0xFF212121);

class _CoordinatorsState extends State<CoordinatorsDiploma> {
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
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: _cardBgColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: <Widget>[
                        _buidProfile(
                            "assets/coordinator/mahesh.png",
                            "Prof. Mahesh Patel",
                            "mahesh.patel@saffrony.ac.in",
                            "Civil"),
                        SizedBox(
                          height: 20,
                        ),
                        _buidProfile(
                            "assets/coordinator/keyur.png",
                            "Prof. Keyur Modi",
                            "keyur.modi@saffrony.ac.in",
                            "ME"),
                        SizedBox(
                          height: 20,
                        ),
                        _buidProfile(
                            "assets/coordinator/sachin.png",
                            "Prof. Sachin Patel",
                            "sachin.patel@saffrony.ac.in",
                            "Civil"),
                      ]),
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

  _buidProfile(String url, String name, String email, String department) {
    return Container(
        child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Color(0XFF515151),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: SizedBox(height: 180, width: 180, child: Image.asset(url)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      name,
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white70),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      (department),
                      style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white70),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                email,
                style: GoogleFonts.comfortaa(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white70),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
