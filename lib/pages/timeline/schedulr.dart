import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import '../../data/schedular_data.dart';

// const items = ["Hello", "how", "Are"];

class TimelinePage extends StatefulWidget {
  TimelinePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List items1 = schedule1;
  List items2 = schedule2;


  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF212121),
      appBar: AppBar(
        backgroundColor: Color(0xff363636),
        title: Text("Schedule"),
        bottom: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.amber,
          tabs: [
            Tab(
              text: "Day 1",
            ),
            Tab(
              text: "Day 2",
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [
          day1schedule(),
          day2Schedule(),
        ],
        controller: _tabController,
      ),
    );
  }

  Container day2Schedule() {
    return Container(
      child: Timeline.builder(
          position: TimelinePosition.Right,
          itemCount: schedule2.length,
          itemBuilder: (context, position) {
            return TimelineModel(itemCard(position,schedule2),
                icon: Icon(FontAwesomeIcons.chevronLeft));
          }),
    );
  }

  Container day1schedule() {
    return Container(
      child: Timeline.builder(
          position: TimelinePosition.Left,
          itemCount: schedule1.length,
          itemBuilder: (context, position) {
            return TimelineModel(itemCard(position,schedule1),
                icon: Icon(FontAwesomeIcons.chevronRight));
          }),
    );
  }

  Card itemCard(int position, items) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                items[position]["date"],
                style: GoogleFonts.comfortaa(
                    color: Colors.white, textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                items[position]["title"],
                textAlign: TextAlign.justify,
                style: GoogleFonts.comfortaa(
                  color: Colors.white,
                  textStyle: TextStyle(fontSize: 16,color: Colors.white70),
                ),
              )
            ]),
      ),
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Color(0xFF515151),
    );
  }
}
