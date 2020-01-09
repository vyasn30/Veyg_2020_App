import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veyg_2020/pages/department_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Veyg 2020",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return DepartmentPage();
      }));
    });
    return Scaffold(

      body: Center(
        child: Image.asset("assets/logo.png"),

      ),
    );
  }
}
