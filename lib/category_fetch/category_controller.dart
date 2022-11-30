import 'package:get/get.dart';
import 'package:restapilive/category_fetch/category_model.dart';
import 'package:restapilive/category_fetch/category_network.dart';

class CategoryController extends GetxController {
  var isLoading = true.obs;
  var categorylist = CategoryModel().obs;
  var categoryModel = CategoryModel().obs;

  @override
  void onInit() {
    fetchAllCategoryList();
    super.onInit();
  }

  void fetchAllCategoryList() async {
    try {
      isLoading(true);
      var allcategory = await CategoryApi.fetchallCategory();
      if (allcategory != null) {
        categorylist.value = allcategory;
        categoryModel.value = allcategory;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  fromJsonList() {}
}
