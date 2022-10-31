import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restapilive/eventsfetch/event_model.dart';

// class EventsApi {
//   static var client = http.Client();

//   static Future<AlleventsModel?> fetchEvents() async {
//     var response =
//         await client.get(Uri.parse("http://172.31.120.238/api/all-events"));

//     try {
//       if (response.statusCode == 200) {
//         var eventString = jsonDecode(response.body);

//         return AlleventsModel.fromJson(eventString);
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }

class EventApi {
  Future<AlleventsModel?> getEventpost() async {
    // var client = http.Client();
    var response =
        await http.get(Uri.parse("http://172.31.120.238/api/all-events"));
    if (response.statusCode == 200) ;
    try {
      if (response.statusCode == 200) {
        print(response.body);
        var eventString = jsonDecode(response.body);
        // print(eventString);
        // return alleventsModelFromJson(eventString);
        return AlleventsModel.fromJson(eventString);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
