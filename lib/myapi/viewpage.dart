import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapilive/myapi/datacontroller.dart';

class ViewPage extends StatelessWidget {
  ViewPage({super.key});

  final AllnotesController controller = Get.put(AllnotesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: controller.mynotelist.value.notes!.length,
          itemBuilder: (context, index) {
            return Text(
                controller.mynotelist.value.notes![index].title.toString());
          },
        ),
      ),
    ));
  }
}
