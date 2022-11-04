import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restapilive/checkmyip/ipcontroller.dart';
import 'package:restapilive/checkmyip/ipmodel.dart';

class MyipApi {
  static Future<MyipModel?> fetchIPdata() async {
    String? finalip = MyipController().mypersonalip;
    String myapilink = "https://ipinfo.io/$finalip/geo";
    var response = await http.get(Uri.parse(myapilink));

    if (response.statusCode == 200) {
      var ipstatus = jsonDecode(response.body);
      // print(ipstatus);
      MyipModel myipModel = MyipModel.fromJson(ipstatus);
      return myipModel;
    }
  }
}
