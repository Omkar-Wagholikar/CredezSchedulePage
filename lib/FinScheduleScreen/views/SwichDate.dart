import "package:flutter/material.dart";
import '../controllers/dateController.dart';
import 'SmallDate.dart';
import 'BigDate.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:get/get.dart';

class SwitcherWidget extends StatelessWidget {
  final CalendarController calenderController;
  final String halfday;
  final String fullDay;
  final String month;
  final int date;
  final String year;
  bool isFirst;
  final int index_;

  SwitcherWidget(
      {super.key,
      required this.halfday,
      required this.fullDay,
      required this.month,
      required this.date,
      required this.year,
      required this.isFirst,
      required this.index_,
      required this.calenderController});

  final eventController = Get.put(eventDateController());

  @override
  Widget build(BuildContext context) {
    print("BUILT WIDGET: $halfday $fullDay $month $date $year");
    return InkWell(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: isFirst == true
              ? smallDate(day: halfday, date: date)
              : bigDate(weekDay: fullDay, month: month, date: date, year: year),
        ),
        onTap: () {
          eventController.changeSelectedDate(index_);
          calenderController.displayDate = DateTime(2023, 3, date);
        });
  }
}
