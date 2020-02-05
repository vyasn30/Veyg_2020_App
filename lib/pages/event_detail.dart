import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:veyg_2020/models/event_detail_model.dart';
import '../models/event.dart';

const Color _cardBgColor = Color(0xFF212121);

class EventDetails extends StatefulWidget {
  final EventDetail event;

  EventDetails(this.event);
  @override
  _EventDetailsState createState() => _EventDetailsState(event);
}

class _EventDetailsState extends State<EventDetails> {
  EventDetail event;
  _EventDetailsState(this.event);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF000000),
              const Color(0xFF323232),
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              leading: IconButton(
                icon: Icon(FontAwesomeIcons.arrowLeft),
                iconSize: 30,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              automaticallyImplyLeading: false,
              elevation: 10,
              expandedHeight: 350.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.all(15),
                title: SafeArea(
                  child: Text(
                    event.name,
                    style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                  ),
                ),
                background: Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.scaleDown,
                ),
              ),
              backgroundColor: Colors.transparent,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                _divider(),
                SizedBox(
                  height: 20,
                ),
                Card(
                    child: Column(children: <Widget>[
                      _singleLine("Date : ", event.date),
                      _singleLine("Rounds : ", event.noOfRounds),
                      _singleLine("Max Participants : ", event.maxParticipants),
                      _singleLine("Team Size : ", event.teamSize),
                      _singleLine("Venue : ", event.venue)
                    ]),
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: _cardBgColor),
                SizedBox(height: 5),
                _inroduction(),
                SizedBox(height: 5),
                _bulletList("Rules", event.rules),
                SizedBox(height: 5),
                _bulletList("Faculty", event.faculty),
                SizedBox(height: 5),
                _bulletList("Student Coordinator", event.studentCoord),
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  _bottomBar() {
    return BottomAppBar(
      color: Color(0xFF323232),
      child: RaisedButton.icon(
        color: Color(0xFF6200ee),
        icon: Icon(
          FontAwesomeIcons.download,
          color: Colors.white70,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        label: Text(
          "Download PDF",
          style: TextStyle(color: Colors.white70, fontSize: 20),
        ),
        onPressed: () => _download(event.pdfUrl),
      ),
    );
  }

  _singleLine(String title, String description) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.comfortaa(
                color: Colors.white, textStyle: TextStyle(fontSize: 24)),
          ),
          Flexible(
            child: Text(
              description,
              style: GoogleFonts.comfortaa(
                color: Colors.white,
                textStyle: TextStyle(fontSize: 24),
              ),
            ),
          )
        ],
      ),
    );
  }

  _inroduction() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Inroduction : ",
                style: GoogleFonts.comfortaa(
                    color: Colors.white, textStyle: TextStyle(fontSize: 28)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                event.introduction,
                textAlign: TextAlign.justify,
                style: GoogleFonts.comfortaa(
                  color: Colors.white,
                  textStyle: TextStyle(fontSize: 20),
                ),
              )
            ]),
      ),
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: _cardBgColor,
    );
  }

  _bulletList(String title, List<String> list) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: GoogleFonts.comfortaa(
                  color: Colors.white, textStyle: TextStyle(fontSize: 28)),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, position) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _bullet(),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.all(3),
                        child: Text(
                          list[position],
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.comfortaa(
                            color: Colors.white,
                            textStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
              itemCount: list.length,
            ),
          ],
        ),
      ),
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: _cardBgColor,
    );
  }

  _divider() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Row(children: <Widget>[
        Expanded(
            child: Divider(
          color: Colors.white,
          thickness: 1.2,
        )),
      ]),
    );
  }

  _bullet() {
    return Container(
      margin: EdgeInsets.all(5),
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  _download(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:veyg_2020/models/event_detail_model.dart';
// import '../models/event.dart';

// const Color _cardBgColor = Color(0xFF212121);

// class EventDetails extends StatefulWidget {
//   final EventDetail event;

//   EventDetails(this.event);
//   @override
//   _EventDetailsState createState() => _EventDetailsState(event);
// }

// class _EventDetailsState extends State<EventDetails> {
//   EventDetail event;
//   _EventDetailsState(this.event);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               const Color(0xFF000000),
//               const Color(0xFF323232),
//             ],
//           ),
//         ),
//         child: CustomScrollView(
//           slivers: <Widget>[
//            SliverAppBar(
//               pinned: false,
//               leading: IconButton(
//                 icon: Icon(FontAwesomeIcons.arrowLeft),
//                 iconSize: 30,
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               automaticallyImplyLeading: false,
//               elevation: 10,
//               expandedHeight: 350.0,
//               flexibleSpace: FlexibleSpaceBar(
//                 centerTitle: true,
//                 titlePadding: EdgeInsets.all(15),
//                 title: Text(
//                   event.name,
//                   style: GoogleFonts.comfortaa(
//                       textStyle:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
//                 ),
//                 background: Image.asset(
//                   "assets/logo.png",
//                   fit: BoxFit.scaleDown,
//                 ),
//               ),
//               backgroundColor: Colors.transparent,
//             ),
//             SliverList(
//               delegate: SliverChildListDelegate([
//                 _divider(),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Card(
//                     child: Column(children: <Widget>[
//                       _singleLine("Date : ", event.date),
//                       _singleLine("Rounds : ", event.noOfRounds),
//                       _singleLine("Max Participants : ", event.maxParticipants),
//                       _singleLine("Team Size : ", event.teamSize),
//                       _singleLine("Venue : ", event.venue)
//                     ]),
//                     elevation: 20,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     color: _cardBgColor),
//                 SizedBox(height: 5),
//                 _inroduction(),
//                 SizedBox(height: 5),
//                 _bulletList("Rules", event.rules),
//                 SizedBox(height: 5),
//                 _bulletList("Faculty", event.faculty),
//                 SizedBox(height: 5),
//                 _bulletList("Student Coordinator", event.studentCoord),
//               ]),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: _bottomBar(),
//     );
//   }

//   _bottomBar() {
//     return BottomAppBar(
//       color: Color(0xFF323232),
//       child: RaisedButton.icon(
//         color: Color(0xFF6200ee),
//         icon: Icon(
//           FontAwesomeIcons.download,
//           color: Colors.white70,
//         ),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         label: Text(
//           "Download PDF",
//           style: TextStyle(color: Colors.white70, fontSize: 20),
//         ),
//         onPressed: () => _download(event.pdfUrl),
//       ),
//     );
//   }

//   _singleLine(String title, String description) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             title,
//             style: GoogleFonts.comfortaa(
//                 color: Colors.white, textStyle: TextStyle(fontSize: 24)),
//           ),
//           Flexible(
//             child: Text(
//               description,
//               style: GoogleFonts.comfortaa(
//                 color: Colors.white,
//                 textStyle: TextStyle(fontSize: 24),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   _inroduction() {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 "Inroduction : ",
//                 style: GoogleFonts.comfortaa(
//                     color: Colors.white, textStyle: TextStyle(fontSize: 28)),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 event.introduction,
//                 textAlign: TextAlign.justify,
//                 style: GoogleFonts.comfortaa(
//                   color: Colors.white,
//                   textStyle: TextStyle(fontSize: 20),
//                 ),
//               )
//             ]),
//       ),
//       elevation: 20,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       color: _cardBgColor,
//     );
//   }

//   _bulletList(String title, List<String> list) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               title,
//               style: GoogleFonts.comfortaa(
//                   color: Colors.white, textStyle: TextStyle(fontSize: 28)),
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemBuilder: (context, position) {
//                 return Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     _bullet(),
//                     Flexible(
//                       child: Container(
//                         margin: EdgeInsets.all(3),
//                         child: Text(
//                           list[position],
//                           textAlign: TextAlign.justify,
//                           style: GoogleFonts.comfortaa(
//                             color: Colors.white,
//                             textStyle: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 );
//               },
//               itemCount: list.length,
//             ),
//           ],
//         ),
//       ),
//       elevation: 20,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       color: _cardBgColor,
//     );
//   }

//   _divider() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
//       child: Row(children: <Widget>[
//         Expanded(
//             child: Divider(
//           color: Colors.white,
//           thickness: 1.2,
//         )),
//       ]),
//     );
//   }

//   _bullet() {
//     return Container(
//       margin: EdgeInsets.all(5),
//       height: 10.0,
//       width: 10.0,
//       decoration: new BoxDecoration(
//         color: Colors.white,
//         shape: BoxShape.circle,
//       ),
//     );
//   }

//   _download(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
