import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapilive/checkmyip/ipcontroller.dart';

class CheckMyip extends StatelessWidget {
  CheckMyip({super.key});

  final MyipController myipController = Get.put(MyipController());
  TextEditingController ipEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Check my IP"),
            ),
            body: Obx(
              (() => myipController.isLoading.value == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            myipController.myipdetails.value.city.toString(),
                          ),
                          Text(
                            myipController.myipdetails.value.region.toString(),
                          ),
                          Text(
                            myipController.myipdetails.value.country.toString(),
                          ),
                          Text(
                            "Postal Code :  ${myipController.myipdetails.value.postal}",
                          ),
                          Text(
                            "${myipController.myipdetails.value.org}",
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: TextField(
                              onChanged: (value) {
                                myipController.mypersonalip = value;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter your ip address",
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                myipController.ipmyfunction();
                                print(myipController.mypersonalip);
                              },
                              child: Text("Submit"))
                        ],
                      ),
                    )),
            )));
  }
}
