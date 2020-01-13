import 'dart:ui';
import 'package:flip_panel/flip_panel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _HomePageState extends State<HomePage> {
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
                    FlipPanel<int>.stream(
                      itemStream: Stream.periodic(
                          Duration(milliseconds: 1000), (count) => count % 10),
                      itemBuilder: (context, value) => Container(
                        color: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          '$value',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50.0,
                              color: Colors.white),
                        ),
                      ),
                      initValue: 0,
                    ),
                    FlipPanel<int>.stream(
                      itemStream: Stream.periodic(
                          Duration(milliseconds: 1000), (count) => count % 10),
                      itemBuilder: (context, value) => Container(
                        color: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          '$value',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50.0,
                              color: Colors.white),
                        ),
                      ),
                      initValue: 0,
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10.0,
                                      sigmaY: 10.0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: Color(0x89545782)),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(
                                          left: 40.0, right: 40.0),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 40.0,
                                          ),
                                          CircleAvatar(
                                            radius: 30.0,
                                            backgroundColor: Color(0xFF8359ff),
                                            child: Icon(
                                              Icons.directions_bus,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40.0,
                                          ),
                                          Text(
                                            'Transport',
                                            style: TextStyle(
                                              color: Color(0xFF8359ff),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
//
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10.0,
                                      sigmaY: 10.0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: Color(0x89545782)),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(
                                          left: 40.0, right: 40.0),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 40.0,
                                          ),
                                          CircleAvatar(
                                            radius: 30.0,
                                            backgroundColor: Color(0xFFff9550),
                                            child: Icon(
                                              FontAwesomeIcons
                                                  .fileInvoiceDollar,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40.0,
                                          ),
                                          Text(
                                            'Bills',
                                            style: TextStyle(
                                              color: Color(0xFFff9550),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10.0,
                                      sigmaY: 10.0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: Color(0x89545782)),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(
                                          left: 40.0, right: 40.0),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 40.0,
                                          ),
                                          CircleAvatar(
                                            radius: 30.0,
                                            backgroundColor: Color(0xFF4975ff),
                                            child: Icon(
                                              FontAwesomeIcons.film,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40.0,
                                          ),
                                          Text(
                                            'Entertainment',
                                            style: TextStyle(
                                              color: Color(0xFF4975ff),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10.0,
                                      sigmaY: 10.0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: Color(0x89545782)),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(
                                          left: 40.0, right: 40.0),
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 40.0,
                                          ),
                                          CircleAvatar(
                                            radius: 30.0,
                                            backgroundColor: Color(0xFF4975ff),
                                            child: Icon(
                                              FontAwesomeIcons.film,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40.0,
                                          ),
                                          Text(
                                            'Entertainment',
                                            style: TextStyle(
                                              color: Color(0xFF4975ff),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
}

class ca {
  static final white = Colors.white;
  static final bgColor = Color(0xFF2b2c4e);
  static final bottomBg = Color(0xFF373956);
  static final containerBg = Color(0x89545782);
  static final navItem = Color(0xFF6f739b);
  static final navItemSelected = Color(0xFFFF56BF);
  static final gradient1 = Color(0xFFff94a9);
  static final gradient2 = Color(0xFFff94a9);
  static final gradient3 = Color(0xFFff40c4);
  static final item1 = Color(0xFF1fa2f5);
  static final item2 = Color(0xFF8359ff);
  static final item3 = Color(0xFFff47e1);
  static final item4 = Color(0xFFff9550);
  static final item5 = Color(0xFF4975ff);
  static final item6 = Color(0xFF0fdf5f);
}
