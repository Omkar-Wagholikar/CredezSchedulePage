import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/dateValues.dart';
// import '../models/dateValues.dart';
// import '../models/dateValues.dart';

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
      Dates("DataWiz", "MONDAY", 2, "MAR", "2022",
          DateTime(2023, 03, 2, 10, 0, 0), DateTime(2023, 03, 2, 11, 0, 0)),
      Dates("not DataWiz", "TUESDAY", 3, "MAR", "2022",
          DateTime(2023, 03, 3, 12, 0, 0), DateTime(2023, 03, 3, 13, 0, 0)),
      Dates("maybe DataWiz", "WEDNESDAY", 4, "MAR", "2022",
          DateTime(2023, 03, 4, 14, 0, 0), DateTime(2023, 03, 4, 15, 30, 0)),
      Dates("maybe DataWiz", "WEDNESDAY", 4, "MAR", "2022",
          DateTime(2023, 03, 4, 16, 0, 0), DateTime(2023, 03, 4, 17, 00, 0)),
    ]);

    currentDate = DateTime(2022, 3, allDates[0].date) as Rx<DateTime>;
  }

  void getSelectedDates() async {
    int total = allDates.length;
    activeDates = RxList(List.generate(total, (index) => true));
    activeDates[0] = false;
  }

  void changeSelectedDate(newIndex) {
    print("This is the new Date index: $newIndex");
    activeDates.fillRange(0, activeDates.length, true);
    activeDates[newIndex] = false;
    update(activeDates);
  }
}
