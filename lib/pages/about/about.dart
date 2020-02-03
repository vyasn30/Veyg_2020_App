import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: <Widget>[
        _prinicipleDegree(),
        Container(
          color: Colors.cyan,
        ),
        Container(
          color: Colors.deepPurple,
        ),
      ],
    );
  }

  _prinicipleDegree() {
    return Container(
          child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset("assets/prinicpal/degree")
            ],
          )
        ],
      ),
    );
  }
}
