import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:restapilive/demoshop/shopcontroller.dart';

class DemoShopView extends StatelessWidget {
  DemoShopView({super.key});

  final ShopController shopController = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Content"),
      ),
      body: Obx(() => shopController.isLoading.value == true
          ? CircularProgressIndicator()
          : Center(
              child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: shopController.shopmodel.value.items!.length,
              itemBuilder: (context, index) {
                return Text(
                  shopController
                      .shopmodel.value.items![index]!.fields!.productCategory
                      .toString(),
                );
              },
            ))),
    );
  }
}
