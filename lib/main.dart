import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veyg_2020/pages/splash_screen.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Slabo'),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
