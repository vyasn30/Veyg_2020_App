import 'dart:async';
import 'dart:ui';
import 'package:flip_panel/flip_panel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veyg_2020/pages/department_page.dart';
import 'package:veyg_2020/pages/gallery/vegy2019.dart';
import 'package:veyg_2020/pages/timeline/schedulr.dart';

final digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _HomePageState extends State<HomePage> {
  int timeRemaining;

  @override
  void initState() {
    var veygDate = new DateTime.utc(2020, DateTime.february, 19);
    var today = new DateTime.now();
    int difference = veygDate.difference(today).inSeconds;
    timeRemaining = difference;
    // Timer.periodic(Duration(seconds: 1), (some) {
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b2c4e),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -100.0,
            left: -10.0,
            child: Transform.rotate(
              angle: 15.0,
              child: Container(
                height: 350.0,
                width: 350.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: <Color>[
                        Color(0xFFff94a9),
                        Color(0xFFff94a9),
                        Color(0xFFff40c4),
                      ]),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 18.0, right: 18.0),
            child: ListView(
//              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50.0),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlipClock.reverseCountdown(
                      digitColor: Colors.white70,
                      backgroundColor: Colors.transparent,
                      digitSize: 50,
                      duration: Duration(seconds: timeRemaining),
                      height: 90,
                      width: 30,
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                // _timer(),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DepartmentPage())),
                        child: _optionCard(
                          "Explore Events",
                          Color(0xFF8359ff),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GalleryExample())),
                        child: _optionCard("VEYG_2019", Color(0xFF4975ff)),
                      ),
                      SizedBox(height: 20.0),
                      _optionCard("Coordinators", Color(0xFFff9550)),
                      SizedBox(height: 20.0),
                       GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TimelinePage())),
                        child:_optionCard("Schedule", Color(0xFF4975ff)),
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _timer() {
    var veygDate = new DateTime.utc(2020, DateTime.february, 19);
    var today = new DateTime.now();
    Duration difference = veygDate.difference(today);
    return Row(
      children: <Widget>[
        Text(difference.inDays.toString()),
        SizedBox(
          width: 10,
        ),
        Text(difference.inHours.toString()),
        SizedBox(
          width: 10,
        ),
        Text(difference.inMinutes.toString()),
        SizedBox(
          width: 10,
        ),
        Text(difference.inSeconds.toString()),
      ],
    );
  }

  _optionCard(String optionTitle, Color bgColour) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10.0,
                      sigmaY: 10.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0x89545782)),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 40.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 30.0,
                                backgroundColor: bgColour,
                                child: Icon(
                                  FontAwesomeIcons.book,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                optionTitle,
                                style: GoogleFonts.comfortaa(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
