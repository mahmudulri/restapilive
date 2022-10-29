import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapilive/apimodule/api_service.dart';
import 'package:restapilive/productmodule/controller/product_controller.dart';
import 'package:http/http.dart';

class ProductListView extends StatelessWidget {
  // final ProductController productController = Get.put(ProductController());
  final AlljobpostController alljobpostController =
      Get.put(AlljobpostController());

  ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          if (alljobpostController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                physics: BouncingScrollPhysics(),
                itemCount: alljobpostController.jobList.value.posts!.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                alljobpostController
                                    .jobList.value.posts![index].postTitle
                                    .toString()
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                alljobpostController
                                    .jobList.value.posts![index].postDescription
                                    .toString()
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                alljobpostController
                                    .jobList.value.posts![index].postType
                                    .toString()
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
        }),
      ),
    );
  }
}
