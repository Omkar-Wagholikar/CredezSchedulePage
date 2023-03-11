import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/dateValues.dart';

class eventDateController extends GetxController {
  var allDates = <Dates>[].obs;
  var currentDate = DateTime.now().obs;
  var activeDates = <bool>[].obs;
  RxInt newIndex = 0.obs;
  
  @override
  void onInit() {
    fetchDates();
    getSelectedDates();
  }

  ScheduleController() {
    fetchDates();
    getSelectedDates();
    changeSelectedDate(newIndex);
  }

  void fetchDates() async {
    allDates = RxList([
      Dates("MONDAY", 2, true, "MAR", "2022"),
      Dates("TUESDAY", 3, false, "MAR", "2022"),
      Dates("WEDNESDAY", 4, true, "MAR", "2022"),
    ]);

    currentDate = DateTime(2022, 3, allDates[0].date) as Rx<DateTime>;
  }

  void getSelectedDates() async {
    int total = allDates.length;
    activeDates = RxList(List.generate(total, (index) => true));
    activeDates[0] = false;
  }

  void changeSelectedDate(newIndex) {
    print("This is the new Date: $newIndex");
    activeDates.fillRange(0, activeDates.length, true);
    activeDates[newIndex] = false;
    update(activeDates);
  }
}
