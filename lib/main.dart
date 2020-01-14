import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veyg_2020/pages/homepage.dart';
import 'package:veyg_2020/pages/events_page.dart';
import 'package:veyg_2020/pages/splash_screen.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Veyg2020",
    home: SplashScreen(),
  ));
}

