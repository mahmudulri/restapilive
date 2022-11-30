import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapilive/category_fetch/cat_dropdown.dart';
import 'package:restapilive/category_fetch/category_view.dart';
import 'package:restapilive/checkmyip/myipview.dart';
import 'package:restapilive/draft.dart';
import 'package:restapilive/eventsfetch/event_view.dart';
import 'package:restapilive/file_picker/filepickview.dart';
import 'package:restapilive/homepage.dart';
import 'package:restapilive/myapi/viewpage.dart';
import 'package:restapilive/productmodule/views/product_list_view.dart';
import 'package:restapilive/randomjoke/jokeview.dart';
import 'package:restapilive/university/universityview.dart';
import 'package:restapilive/userapi/userview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FilePickerImage());
  }
}
