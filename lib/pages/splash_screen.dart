import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veyg_2020/pages/homepage.dart';
import 'package:veyg_2020/services/event_data_service.dart';
import 'package:connectivity/connectivity.dart';
import 'network_error.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool firstAnimComplete = false;
  bool secondtAnimComplete = false;
  bool thirdAnimComplete = false;

  bool firstNotPlayed = true;
  bool secondNotPlayed = true;
  bool thirdNotPlayed = true;

  // List<Widget> widgetList = ;

  @override
  initState() {
    fetchData();
  }

  fetchData() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
      }
    } on SocketException catch (_) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => NoConnectionError()));
    }

    if (EventDataService.fetchData() == -1) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => NoConnectionError()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b2c4e),
      body: Container(
        margin: EdgeInsets.fromLTRB(5, 30, 5, 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.solidCircle,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 6,
                ),
                Icon(
                  FontAwesomeIcons.solidCircle,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 6,
                ),
                Icon(
                  FontAwesomeIcons.solidCircle,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "S@ffrony",
                  style: GoogleFonts.bitter(
                      textStyle:
                          TextStyle(fontSize: 26.0, color: Colors.greenAccent)),
                ),
                Icon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.grey,
                  size: 30,
                ),
                TypewriterAnimatedTextKit(
                    totalRepeatCount: 1,
                    onFinished: () {
                      // widgetList.add(Text(""));
                      setState(() {
                        firstAnimComplete = true;
                      });
                    },
                    text: [
                      "./VEYG_2020",
                    ],
                    speed: Duration(milliseconds: 400),
                    textStyle: GoogleFonts.bitter(
                        textStyle:
                            TextStyle(fontSize: 30.0, color: Colors.white)),
                    textAlign: TextAlign.start,
                    alignment:
                        AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              _buildSecondWidget(),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              _buildThirdWidget(),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              _buildFourthWidget()
            ],
          )
        ]),
      ),
    );
  }

  _buildSecondWidget() {
    return firstAnimComplete
        ? TypewriterAnimatedTextKit(
            totalRepeatCount: 1,
            onFinished: () {
              // widgetList.add(Text(""));
              setState(() {
                secondtAnimComplete = true;
                firstNotPlayed = false;
              });
            },
            text: [
              "Loading...\n",
            ],
            textStyle: GoogleFonts.bitter(
                textStyle: TextStyle(fontSize: 24.0, color: Colors.white)),
            textAlign: TextAlign.start,
            alignment: AlignmentDirectional.topStart // or Alignment.topLeft
            )
        : Container();
  }

  _buildThirdWidget() {
    return secondtAnimComplete
        ? TypewriterAnimatedTextKit(
            totalRepeatCount: 1,
            onFinished: () {
              // widgetList.add(Text(""));
              setState(() {
                thirdAnimComplete = true;
              });
            },
            text: [
              "Be Awesome...",
              "Be Optimistic...",
              "Be Different...",
            ],
            textStyle: GoogleFonts.bitter(
                textStyle: TextStyle(fontSize: 24.0, color: Colors.white)),
            textAlign: TextAlign.start,
            alignment: AlignmentDirectional.topStart // or Alignment.topLeft
            )
        : Container();
  }

  _buildFourthWidget() {
    return thirdAnimComplete
        ? TypewriterAnimatedTextKit(
            onFinished: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
            totalRepeatCount: 1,
            text: ["All done", "Let's Start"],
            textStyle: GoogleFonts.bitter(
                textStyle: TextStyle(fontSize: 24.0, color: Colors.white)),
            textAlign: TextAlign.start,
            alignment: AlignmentDirectional.topStart // or Alignment.topLeft
            )
        : Container();
  }
}
