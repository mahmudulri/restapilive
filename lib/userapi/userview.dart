import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapilive/userapi/usercontroller.dart';
import 'package:restapilive/userapi/userdetails.dart';

class UserViewPage extends StatefulWidget {
  UserViewPage({super.key});

  @override
  State<UserViewPage> createState() => _UserViewPageState();
}

class _UserViewPageState extends State<UserViewPage> {
  final UserController userController = Get.put(UserController());

  String name = "hasan";

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
                                          onPressed: () {
                                            Get.to(UserDetailsPage(
                                              name:
                                                  "${userController.alluserlist.value[index].name}",
                                              street:
                                                  "${userController.alluserlist.value[index].address!.street}",
                                            ));

                                            // Get.defaultDialog(
                                            //   title: "Name "
                                            //       "${userController.alluserlist.value[index].username}",
                                            //   content: Column(
                                            //     children: [
                                            //       Text(userController
                                            //           .alluserlist
                                            //           .value[index]
                                            //           .address!
                                            //           .street
                                            //           .toString()),
                                            //       Text(userController
                                            //           .alluserlist
                                            //           .value[index]
                                            //           .address!
                                            //           .zipcode
                                            //           .toString()),
                                            //     ],
                                            //   ),
                                            // );
                                          },
                                          child: Text("Show Details"),
                                        ),
                                      ],
                                    )
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
