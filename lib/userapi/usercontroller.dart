import 'package:get/get.dart';
import 'package:restapilive/userapi/usermodel.dart';
import 'package:restapilive/userapi/usernetwork.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    fetchAllusers();
    super.onInit();
  }

  var isLoading = true.obs;

  var alluserlist = <UserModel>[].obs;

  void fetchAllusers() async {
    try {
      isLoading(true);
      var alluser = await UserApi.fetchAllusers();
      if (alluser != null) {
        alluserlist.assignAll(alluser);
      }
    } finally {
      isLoading(false);
    }
  }
}
