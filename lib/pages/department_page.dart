import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veyg_2020/models/department.dart';
import 'package:veyg_2020/pages/events_page.dart';
import '../data/department_data.dart';

class DepartmentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DepartmentState();
  }
}

class DepartmentState extends State {
  final PageController ctrl = PageController(viewportFraction: 0.85);
  List<Department> deptartment_data;
  int currentPage = 0;

  @override
  void initState() {
    deptartment_data = dept_data;
    ctrl.addListener(() {
      int next = ctrl.page.round();

      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 1500),
        curve: Curves.easeOutQuint,
        decoration: BoxDecoration(color: deptartment_data[currentPage].color),
        child: PageView.builder(
          controller: ctrl,
          itemBuilder: (context, position) {
            bool isActive = position == currentPage;
            return _buildPage(position, isActive);
          },
          itemCount: deptartment_data.length, // Can be null
        ),
      ),
    );
  }

  Widget _buildPage(position, isActive) {
    final double blur = isActive ? 15 : 0;
    final double offset = isActive ? 20 : 0;
    final double top = isActive ? 100 : 200;

    return GestureDetector(
      onTap: () => _navigate(deptartment_data[position]),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOutQuint,
        margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
        child: ClipRRect(
          // make sure we apply clip it properly
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black.withOpacity(0.4),
              ),
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                ),
                child: Text(deptartment_data[position].name,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w900,
                          color: Colors.white),
                    )),
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.indigo,
            image: DecorationImage(
                image: ExactAssetImage(deptartment_data[position].image),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: blur,
                  offset: Offset(offset, offset))
            ]),
      ),
    );
  }

  _navigate(Department deptartment_data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EventsPage(deptartment_data)));
  }
}
