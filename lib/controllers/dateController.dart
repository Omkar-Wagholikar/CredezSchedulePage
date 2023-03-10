import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/dateValues.dart';

class eventDateController extends GetxController {
  var allDates = <Dates>[].obs;
  var activeDate = DateTime.now().obs;
  @override
  void onInit() {
    fetchDates();
  }

  ScheduleController() {
    fetchDates();
  }

  void fetchDates() async {
    allDates = RxList([
      Dates("MONDAY", 2, true, "MAR", "2022"),
      Dates("TUESDAY", 3, false, "MAR", "2022"),
      Dates("WEDNESDAY", 4, true, "MAR", "2022"),
    ]);

    activeDate = DateTime(2022, 3, allDates[0].date) as Rx<DateTime>;
  }
}
