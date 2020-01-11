import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veyg_2020/pages/department_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
          child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return DepartmentPage();
          }));
        },
            child: Container(
          decoration: BoxDecoration(color: Colors.white70),
          child: Center(
            child: Image.asset("assets/logo.png"),
          ),
        ),
      ),
    );
  }
}
