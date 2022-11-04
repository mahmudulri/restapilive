import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restapilive/randomjoke/jokemodel.dart';

class jokeApi {
  static Future<JokeModel?> fetchallJokes() async {
    var response = await http
        .get(Uri.parse("https://official-joke-api.appspot.com/random_joke"));

    if (response.statusCode == 200) {
      var alljokesdata = jsonDecode(response.body);
      print(alljokesdata);
      JokeModel jokeModel = JokeModel.fromJson(alljokesdata);
      return jokeModel;
    }
  }
}
