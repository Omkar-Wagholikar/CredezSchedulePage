import 'package:flutter/material.dart';
import 'package:laptop/controllers/scheduleControllers.dart';
import '../views/singleEventScheduleCard.dart';
import 'package:get/get.dart';

class EventsList extends StatelessWidget {
  final controller = Get.put(ScheduleController());
  EventsList(double ratioInp, {Key? key}) : super(key: key);
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    // return IndividualEvent('name', ' venue', 'teamStatus');
    print("HERE");
    print(controller.allEvents);
    return ListView.builder(
      controller: scrollController,
      itemCount: controller.allEvents.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: IndividualEvent(
              controller.allEvents[index].name,
              controller.allEvents[index].venue,
              controller.allEvents[index].teamStatus),
        );
      },
    );
  }
}
