import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restapilive/productmodule/models/product_model.dart';

class JobPostApi {
  static var client = http.Client();
  static Future<AlljobPostModel?> fetchAlljobPost() async {
    var response =
        await client.get(Uri.parse("http://172.31.120.238/api/all-posts"));

    if (response.statusCode == 200) {
      var jsonString = jsonDecode(response.body);
      // print("From API  " + jsonString.toString());

      // print(jsonString);

      AlljobPostModel alljobPostModel = AlljobPostModel.fromJson(jsonString);
      return alljobPostModel;
    }
  }
}
