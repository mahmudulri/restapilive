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

bool _obscureText = true;
String? _password;

class _CatDropDownSearchState extends State<CatDropDownSearch> {
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final CategoryController catcontroller = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: () {
                      _toggle();
                    },
                    child: Icon(
                      Icons.remove_red_eye,
                      color: _obscureText ? Colors.grey : Colors.green,
                    )),
                labelText: 'Password',
              ),
              onSaved: (val) => _password = val,
              obscureText: _obscureText,
            ),
          ],
        ),
      ),
    ));
  }
}
