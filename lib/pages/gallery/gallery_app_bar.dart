import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ExampleAppBar extends StatelessWidget {
  const ExampleAppBar({this.title, this.showGoBack = false}) : super();

  final String title;
  final bool showGoBack;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            decoration: const BoxDecoration(
                color: Color(0xff363636),
                borderRadius: const BorderRadius.only(
                    bottomLeft: const Radius.circular(10.0),
                    bottomRight: const Radius.circular(10.0)),
                boxShadow: <BoxShadow>[
                  const BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 10.0,
                      blurRadius: 20.0)
                ]),
            child: Row(
              children: <Widget>[
                Container(
                  child: showGoBack
                      ? IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.white70,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          padding: EdgeInsets.zero,
                        )
                      : Container(
                          height: 50.0,
                        ),
                ),
                Expanded(
                  child: Text(title,
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white70),
                      )),
                )
              ],
            )));
  }
}
