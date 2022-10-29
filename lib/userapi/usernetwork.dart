import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restapilive/userapi/usermodel.dart';

class UserApi {
  static var client = http.Client();

  static Future<List<UserModel>?> fetchAllusers() async {
    var response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      var userjsondata = response.body;

      print(userjsondata);

      return userModelFromJson(userjsondata);
    }
  }
}
