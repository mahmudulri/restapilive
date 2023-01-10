import 'package:http/http.dart' as http;
import 'package:restapilive/demoshop/shopmodel.dart';
import 'package:restapilive/userapi/usermodel.dart';

class ShopApi {
  static var client = http.Client();

  static Future<ShopModel?> fetchShopdata() async {
    var response = await client.get(Uri.parse(
        "https://cdn.contentful.com/spaces/fcsfqjpv7iur/environments/master/entries?access_token=T7nj0GqSYm43QCA83G3maR3PCPlIIoYe2dzWemh5yw0&content_type=demoshop"));

    if (response.statusCode == 200) {
      var userjsondata = response.body;

      print(userjsondata);

      return shopModelFromJson(userjsondata);
    }
  }
}
