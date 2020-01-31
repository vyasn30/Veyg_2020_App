import 'dart:convert';

import '../data/event_detail_data.dart';

class EventDetail{
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


 factory EventDetail.fromJson(Map<String,dynamic> parsedJson){
  return EventDetail(
   id : parsedJson['id'],
   deptId : parsedJson['deptId'],
   name : parsedJson['name'],
   date : parsedJson['date'],
   venue : parsedJson['venue'],
   maxParticipants : parsedJson['maxParticipants'],
   teamSize : parsedJson['teamSize'],
   noOfRounds : parsedJson['noOfRounds'],
   faculty : parsedJson['faculty'] == null ? [] : stringListFromJson(parsedJson['faculty']),
   introduction : parsedJson['introduction'],
   rules : parsedJson['rules'] == null ? [] : stringListFromJson(parsedJson['rules']),
   pdfUrl : parsedJson['pdfUrl'],
   studentCoord : parsedJson['studentCoord'] == null ? [] : stringListFromJson(parsedJson['studentCoord']),
  );
 }

 static List<EventDetail> listFromJson(List<dynamic> list) {
  List<EventDetail> rows = list.map((i) => EventDetail.fromJson(i)).toList();
  return rows;
 }

 static List<EventDetail> listFromString(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<EventDetail>((json) => EventDetail.fromJson(json)).toList();
 }

  Map<String,dynamic> toJson()=>{
   'id' : id,
   'deptId' : deptId,
   'name' : name,
   'date' : date,
   'venue' : venue,
   'maxParticipants' : maxParticipants,
   'teamSize' : teamSize,
   'noOfRounds' : noOfRounds,
   'faculty' : faculty,
   'introduction' : introduction,
   'rules' : rules,
   'pdfUrl' : pdfUrl,
   'studentCoord' : studentCoord,
 };

static List<String> stringListFromJson(List<dynamic> list){
  List<String> tempList = [];
  list.forEach((item){
    tempList.add(item);
  });
  return tempList;
}


}