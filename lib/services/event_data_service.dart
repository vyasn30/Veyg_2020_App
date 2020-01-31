import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:veyg_2020/models/event_detail_model.dart';

class EventDataService {
  static List<EventDetail> data;

  static fetchData() async {
    var url = 'http://rajpar29.pythonanywhere.com/veyg';
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var dataJson = json.decode(response.body);
        data = EventDetail.listFromJson(dataJson);
        return 1;
      }
    } catch (exception) {
      return -1;
    }

    return -1;
  }

  getOfflineData() {
    return data;
  }

  static getEventByEventId(int eventId) {
    return data.where((event) => event.id == eventId).toList();
  }

  static getEventByDept(int deptId) {
    return data.where((event) => event.deptId == deptId).toList();
  }
}
