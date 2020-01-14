import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veyg_2020/pages/homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b2c4e),
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
        },
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 250.0,
              child: TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 700),
                  onTap: () {
                    print("Tap Event");
                  },
                  text: [
                    "Veyg 2020",
                  ],
                  textStyle: TextStyle(
                      fontSize: 30.0, fontFamily: "Agne", color: Colors.white),
                  textAlign: TextAlign.start,
                  alignment:
                      AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
            ),
            Image.asset("assets/logo.png"),
          ],
        ),
      ),
    );
  }
}
