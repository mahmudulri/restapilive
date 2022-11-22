import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapilive/randomjoke/jokecontroller.dart';
import 'package:restapilive/userapi/userview.dart';

class JokesView extends StatefulWidget {
  JokesView({super.key});

  @override
  State<JokesView> createState() => _JokesViewState();
}

class _JokesViewState extends State<JokesView> {
  final JokesController jokesController = Get.put(JokesController());

  // void initState() {
  //   super.initState();

  //   Future.delayed(
  //       Duration(seconds: 5),
  //       () => Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => JokesView()),
  //           ));
  //   jokesController.fetchJokes();
  // }

  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 2), () => UserViewPage());
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Random Jokes"),
            ),
            body: Obx(
              (() => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: jokesController.isLoading.value == true
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Click to change the Jokes",
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 200,
                                  width: screenWidth,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          "Jokes ID --  ${jokesController.allfinaljokes.value.id}"),
                                      Text(
                                          "Jokes Type    ${jokesController.allfinaljokes.value.type}"),
                                      Text(jokesController
                                          .allfinaljokes.value.setup
                                          .toString()),
                                      Text(jokesController
                                          .allfinaljokes.value.punchline
                                          .toString()),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    jokesController.fetchJokes();
                                    print("change");
                                  },
                                  child: Text("Change now"),
                                ),
                              ],
                            ),
                          ),
                  )),
            )));
  }
}
