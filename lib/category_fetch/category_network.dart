import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restapilive/category_fetch/category_model.dart';

class CategoryApi {
  static Future<CategoryModel?> fetchallCategory() async {
    var response =
        await http.get(Uri.parse("http://172.31.120.238:80/api/department"));

    if (response.statusCode == 200) {
      var allcategory = jsonDecode(response.body);
      print(allcategory);
      CategoryModel categoryModel = CategoryModel.fromJson(allcategory);
      return categoryModel;
    }
  }
}
