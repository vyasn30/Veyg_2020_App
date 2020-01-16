import '../data/event_detail_data.dart';

class EventDetail {
  int id;
  int deptId;
  String name;
  String date;
  String venue;
  String maxParticipants;
  String teamSize;
  String noOfRounds;
  List<String> faculty;
  String introduction;
  List<String> rules;
  String pdfUrl;
  List<String> studentCoord;
  EventDetail({
    this.id,
    this.deptId,
    this.name,
    this.date,
    this.venue,
    this.maxParticipants,
    this.teamSize,
    this.noOfRounds,
    this.faculty,
    this.introduction,
    this.rules,
    this.pdfUrl,
    this.studentCoord,
  });

  static getEventByEventId(int eventId) {
    return events.where((event) => event.id == eventId).toList();
  }
  static getEventByDept(int deptId) {
    return events.where((event) => event.deptId == deptId).toList();
  }

 
}