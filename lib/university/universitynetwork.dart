import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restapilive/university/universitymodel.dart';

// static Future<List<UserModel>?> fetchAllusers() async {
//   var response = await client
//       .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

//   if (response.statusCode == 200) {
//     var userjsondata = response.body;

//     print(userjsondata);

//     return userModelFromJson(userjsondata);
//   }
// }

class UniversityApi {
  static var client = http.Client();

  static Future<List<UniversityModel>?> fetchUnivData() async {
    var response = await http.Client().get(Uri.parse(
        "http://universities.hipolabs.com/search?country=United+States"));
    if (response.statusCode == 200) {
      var alluniv = response.body;
      print(alluniv);
      return universityModelFromJson(alluniv);
    }
  }
}
