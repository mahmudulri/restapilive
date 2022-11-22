import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapilive/university/universitycontroller.dart';

class UniversityList extends StatelessWidget {
  UniversityList({super.key});
  final UnivController univcontroller = Get.put(UnivController());
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("University List"),
        ),
        body: Obx(
          (() => Padding(
                padding: const EdgeInsets.all(20.0),
                child: univcontroller.isLoading.value == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            height: 100,
                            width: screenWidth,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Name : ${univcontroller.allunivdatalist[index].name}"),
                                  Text(
                                      "Domain : ${univcontroller.allunivdatalist[index].domains![0]}"),
                                  Text(
                                      "Country : ${univcontroller.allunivdatalist[index].country.toString()}"),
                                  Text(
                                      "Alpha two codee : ${univcontroller.allunivdatalist[index].alphaTwoCode.toString()}"),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: univcontroller.allunivdatalist.length,
                      ),
              )),
        ),
      ),
    );
  }
}
