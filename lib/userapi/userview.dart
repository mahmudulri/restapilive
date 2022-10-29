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
        body: Obx(
          (() {
            if (userController.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: userController.alluserlist.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          child: Container(
                            height: 160,
                            width: 300,
                            color: Colors.grey.shade200,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Username : ${userController.alluserlist.value[index].username}",
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Name : ${userController.alluserlist.value[index].name}",
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Emai-l : ${userController.alluserlist.value[index].email}",
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey,
                                          ),
                                          onPressed: () {},
                                          child: Text("Show Details"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
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
      ),
    );
  }
}
