import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:restapilive/category_fetch/category_controller.dart';

class CategoryData extends StatelessWidget {
  CategoryData({super.key});

  final CategoryController catcontroller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 50,
          );
        },
        itemCount: catcontroller.categorylist.value.department!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      print(catcontroller
                          .categorylist.value.department![index].id
                          .toString());
                    },
                    child: Container(
                      color: Colors.green,
                      child: Text(
                        catcontroller.categorylist.value.department![index]
                            .departmentName
                            .toString(),
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(catcontroller.categorylist.value.department![index].id
                      .toString()),
                ],
              ),
            ],
          );
        },
      ),
    )));
  }
}
