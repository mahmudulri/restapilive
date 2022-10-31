import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restapilive/eventsfetch/event_controller.dart';

class EventView extends StatelessWidget {
  final EventsController eventsController = Get.put(EventsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Obx(
      (() => Padding(
            padding: const EdgeInsets.all(20.0),
            child: eventsController.isLoading.value == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount:
                        eventsController.alleventsdata.value.allEvents!.length,
                    itemBuilder: (context, index) {
                      return Text(eventsController
                          .alleventsdata.value.allEvents![index].eventTitle
                          .toString());
                    },
                  ),
          )),
    )));
  }
}
