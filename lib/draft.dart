import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DraftPage extends StatelessWidget {
  const DraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.defaultDialog(
              title: "Alert",
            );
          },
          child: Text("Click Now"),
        ),
      ),
    ));
  }
}
