import 'package:get/get.dart';
import 'package:restapilive/apimodule/api_service.dart';
import 'package:restapilive/productmodule/models/product_model.dart';

class AlljobpostController extends GetxController {
  @override
  void onInit() {
    fetchjobpostlist();
    super.onInit();
  }

  var isLoading = true.obs;

  var jobList = AlljobPostModel().obs;

  void fetchjobpostlist() async {
    try {
      isLoading(true);
      var alljobs = await JobPostApi.fetchAlljobPost();
      if (alljobs != null) {
        jobList.value = alljobs;
      }
    } finally {
      isLoading(false);
    }
  }
}
