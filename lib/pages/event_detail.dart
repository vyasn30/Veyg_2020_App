import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatefulWidget {
  final int eventId;

  EventDetails(this.eventId);
  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event_Detail"),
      ),
      body: Center(child: Text("Done"),),
    );
  }
}
