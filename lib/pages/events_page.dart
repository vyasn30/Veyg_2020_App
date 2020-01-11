import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell/widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veyg_2020/models/department.dart';
import 'package:veyg_2020/models/event.dart';
import 'package:veyg_2020/pages/event_detail.dart';

class EventsPage extends StatelessWidget {
  final Department dept;
  List<Event> eventList;
  EventsPage(this.dept) {
    eventList = Event.getEventByDept(dept.id);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: CustomScrollView(
        
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            leading: IconButton(icon: Icon(FontAwesomeIcons.arrowLeft),iconSize: 30,onPressed: (){
              Navigator.pop(context);
            },),
            automaticallyImplyLeading: false,
            elevation: 10,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(dept.name, style: GoogleFonts.comfortaa(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),),
            ),
            backgroundColor: Colors.transparent,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return SimpleFoldingCell(
                  frontWidget: _buildFrontWidget(index),
                  innerTopWidget: _buildInnerTopWidget(index),
                  innerBottomWidget: _buildInnerBottomWidget(index),
                  cellSize: Size(MediaQuery.of(context).size.width, 200),
                  padding: EdgeInsets.all(15),
                  animationDuration: Duration(milliseconds: 300),
                  borderRadius: 10,
                  onOpen: () => print('$index cell opened'),
                  onClose: () => print('$index cell closed'));
            }, childCount: eventList.length),
          )
        ],
        // child: Container(
        //   color: Color(0xFF2e282a),
        //   child: ListView.builder(
        //     itemCount: eventList.length,
        //     itemBuilder: (context, index) {
        //       return SimpleFoldingCell(
        //           frontWidget: _buildFrontWidget(index),
        //           innerTopWidget: _buildInnerTopWidget(index),
        //           innerBottomWidget: _buildInnerBottomWidget(index),
        //           cellSize: Size(MediaQuery.of(context).size.width, 200),
        //           padding: EdgeInsets.all(15),
        //           animationDuration: Duration(milliseconds: 300),
        //           borderRadius: 10,
        //           onOpen: () => print('$index cell opened'),
        //           onClose: () => print('$index cell closed'));
        //     },
        //   ),
        // ),
      ),
    );
  }

  Widget _buildFrontWidget(int index) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () => toggleCard(context),
        child: Container(
            color: Color(0xFFffcd3c),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${eventList[index].name}",
                  style: GoogleFonts.amaticSC(
                    textStyle: TextStyle(
                        color: Color(0xFF2e282a),
                        fontSize: 42.0,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            )),
      );
    });
  }

  Widget _buildInnerTopWidget(int index) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () => toggleCard(context),
        child: Container(
          padding: EdgeInsets.all(5.0),
          color: Color(0xFFff9234),
          alignment: Alignment.center,
          child: Text(
            "${eventList[index].description}",
            style: GoogleFonts.josefinSans(
              textStyle: TextStyle(
                  color: Color(0xFF2e282a),
                  fontSize: 27.0,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildInnerBottomWidget(int index) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () => toggleCard(context),
          child: Container(
              color: Color(0xFFecf2f9),
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: Row(
                          children: <Widget>[
                            Text("More Details"),
                            Icon(FontAwesomeIcons.arrowRight),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EventDetails(eventList[index].id)));
                        },
                      ),
                    ],
                  )
                ],
              )),
        );
      },
    );
  }

  toggleCard(BuildContext context) {
    SimpleFoldingCellState foldingCellState =
        context.findAncestorStateOfType<SimpleFoldingCellState>();
    foldingCellState?.toggleFold();
  }
}
