import 'package:get/get.dart';
import 'package:restapilive/myapi/datamodel.dart';
import 'package:restapilive/myapi/network.dart';

class AllnotesController extends GetxController {
  @override
  void onInit() {
    fetchAllnotes();
    super.onInit();
  }

  var isLoading = true.obs;
  var mynotelist = AllnotesModel().obs;

  void fetchAllnotes() async {
    try {
      isLoading(true);
      var allpost = await NotesApi.fetchAllnotes();
      if (allpost != null) {
        mynotelist.value = allpost;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
