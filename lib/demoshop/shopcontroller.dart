import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapilive/demoshop/shopmodel.dart';
import 'package:restapilive/demoshop/shopnetwork.dart';

class ShopController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchShopdata();
  }

  var isLoading = false.obs;

  var alluserlist = <ShopModel>[].obs;

  var shopmodel = ShopModel().obs;

  void fetchShopdata() async {
    try {
      isLoading(true);
      var shopdata = await ShopApi.fetchShopdata();
      if (shopdata != null) {
        shopmodel.value = shopdata;
        print(shopdata.toString());
      }
    } finally {
      isLoading(false);
    }
  }
}
