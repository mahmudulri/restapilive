import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restapilive/myapi/datamodel.dart';

class NotesApi {
  static var client = http.Client();
  static Future<AllnotesModel?> fetchAllnotes() async {
    var response = await http.get(
        Uri.parse("https://restapi.mahmudulhasanproject.xyz/api/all-notes"));

    if (response.statusCode == 200) {
      var myjsondata = jsonDecode(response.body);
      print(myjsondata);
      AllnotesModel allnotesModel = AllnotesModel.fromJson(myjsondata);
      return allnotesModel;
    }
  }
}
