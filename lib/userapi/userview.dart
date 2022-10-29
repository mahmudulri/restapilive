import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapilive/userapi/usercontroller.dart';

class UserViewPage extends StatelessWidget {
  UserViewPage({super.key});

  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Text("User View Model"),
    ));
  }
}
