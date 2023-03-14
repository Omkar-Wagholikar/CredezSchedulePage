import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../models/event.dart';
import '../models/event.dart';
// import '../models/event.dart';

class ScheduleController extends GetxController {
  var allEvents = <Event>[].obs;

  @override
  void onInit() {
    fetchEvents();
  }

  ScheduleController() {
    fetchEvents();
  }

  void fetchEvents() async {
    // await Future.delayed(Duration(seconds: 1));

    allEvents = RxList([
      Event("Event1", 1, 26, 2, "multiplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event2", 2, 26, 2, "singleplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event3", 3, 26, 2, "multiplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event1", 1, 26, 2, "multiplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event2", 2, 26, 2, "singleplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event3", 3, 26, 2, "multiplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event4", 4, 27, 2, "singleplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event5", 5, 27, 2, "multiplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event6", 6, 27, 2, "singleplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event5", 5, 27, 2, "multiplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event6", 6, 27, 2, "singleplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event5", 5, 27, 2, "multiplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event6", 6, 27, 2, "singleplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event7", 7, 28, 2, "multiplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event8", 8, 28, 2, "singleplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event9", 9, 28, 2, "singleplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event8", 8, 28, 2, "singleplayer", 10, "description", "A1",
          "Back Info"),
      Event("Event99", 9, 28, 2, "singleplayer", 10, "description", "A1",
          "Back Info"),
    ]);
  }
}
