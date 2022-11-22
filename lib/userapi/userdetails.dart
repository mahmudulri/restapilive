import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  UserDetailsPage({super.key, this.name, this.street});

  String? name;
  String? street;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Name : $name",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text(
              "Address $street",
              style: TextStyle(
                fontSize: 25,
              ),
            ),

            Text("asds"),
          ],
        ),
      ),
    ));
  }
}
