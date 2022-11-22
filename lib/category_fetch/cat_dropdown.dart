import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapilive/category_fetch/category_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:restapilive/category_fetch/category_model.dart';

class CatDropDownSearch extends StatefulWidget {
  const CatDropDownSearch({super.key});

  @override
  State<CatDropDownSearch> createState() => _CatDropDownSearchState();
}

class _CatDropDownSearchState extends State<CatDropDownSearch> {
  final CategoryController catcontroller = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DropdownSearch<CategoryModel>(
              asyncItems: (String filter) =>
                  catcontroller.fetchAllCategoryList(),
              itemAsString: (CategoryModel u) => u.userAsStringByName(),
              onChanged: (CategoryModel? data) => print(data),
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration:
                    InputDecoration(labelText: "User by name"),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
