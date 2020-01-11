import '../data/event_data.dart';

class Event {
  String name;
  int id;
  int deptId;
  String description;
  String category;
  Event({this.name, this.id, this.deptId, this.description, this.category});

  static getEventByDept(int deptId) {
    return events.where((event) => event.deptId == deptId).toList();
  }

  static getEventByEventId(int eventId) {
    return events.where((event) => event.id == eventId).toList();
  }

 
}
