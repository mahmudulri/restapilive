import 'package:get/get.dart';
import 'package:restapilive/university/universitymodel.dart';
import 'package:restapilive/university/universitynetwork.dart';

class UnivController extends GetxController {
  @override
  void onInit() {
    fetchAllunivData();
    super.onInit();
  }

  var isLoading = true.obs;

  var allunivdatalist = <UniversityModel>[].obs;

  void fetchAllunivData() async {
    try {
      isLoading(true);
      var allmylist = await UniversityApi.fetchUnivData();
      if (allmylist != null) {
        allunivdatalist.value = allmylist;
        print(allunivdatalist);
      }
    } finally {
      isLoading(false);
    }
  }
}
