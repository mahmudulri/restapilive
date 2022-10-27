import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SingleData extends StatefulWidget {
  const SingleData({super.key});

  @override
  State<SingleData> createState() => _SingleDataState();
}

class _SingleDataState extends State<SingleData> {
  TextEditingController titleController = TextEditingController();
  Map<String, dynamic> todos = {};
  bool isLoading = false;

  String myid = "62";

  @override
  void initState() {
    getTodo();
    titleController = TextEditingController();

    super.initState();
  }

  Future getTodo() async {
    String myurl = "https://restapi.mahmudulhasanproject.xyz/api/note/$myid";
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
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            Text("Enter the number"),
            TextField(),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Submit data")),
            SizedBox(
              height: 50,
            ),
            Text("this is title"),
          ],
        ),
      ),
    ));
  }
}
