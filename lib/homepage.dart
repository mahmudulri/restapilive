import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Map<String, dynamic> todos = {};
  bool isLoading = false;

  String myid = "api";

  @override
  void initState() {
    getTodo();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  Future getTodo() async {
    String myurl = "https://restapi.mahmudulhasanproject.xyz/$myid/all-notes";
    final response = await http.get(Uri.parse(myurl));

    if (response.statusCode == 200) {
      setState(() {
        todos = jsonDecode(response.body);
      });
      print(todos);
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   centerTitle: true,
      //   title: Text("API Data"),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ElevatedButton(
                          //   onPressed: () {},
                          //   child: Text("Add data"),
                          // ),
                          // ElevatedButton(
                          //   onPressed: () {},
                          //   child: Text("Update data"),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                ),
                // child: ListView.builder(
                //   itemCount: todos["notes"].,
                // )
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
