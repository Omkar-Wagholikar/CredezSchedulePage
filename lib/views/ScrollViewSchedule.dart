// Working anim
import "package:flutter/material.dart";
import 'SmallDate.dart';
import 'BigDate.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:laptop/controllers/dateController.dart';
import 'package:get/get.dart';

class scrollViewTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(eventDateController());
    final CalendarController calenderController = CalendarController();

    print("inside topWidget: \nLENGTH: ${eventController.allDates.length}");
    print(
        "DATE: ${eventController.allDates[1].date}\nDAY: ${eventController.allDates[1].day}\nHALFDAY: ${eventController.allDates[1].day.substring(0, 3)}\nMONTH: ${eventController.allDates[1].month}\nYEAR: ${eventController.allDates[1].year}\nTop complete");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Here ya go!"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
                height: 111,
                child: Obx(() => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: eventController.allDates.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Obx(() => SwitcherWidget(
                                date: eventController.allDates[index].date,
                                fullDay: eventController.allDates[index].day,
                                halfday: eventController.allDates[index].day
                                    .substring(0, 3),
                                isFirst: eventController.activeDates[index],
                                month: eventController.allDates[index].month,
                                year: eventController.allDates[index].year,
                                index_: index,
                                calenderController: calenderController,
                              )),
                        );
                      },
                    ))),
            Expanded(
              child: SfCalendar(
                controller: calenderController,

                view: CalendarView.day,
                timeSlotViewSettings:
                    const TimeSlotViewSettings(endHour: 9 + 12, startHour: 7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
          transitionBuilder: (widget, animation) => ScaleTransition(
            scale: animation,
            child: widget,
          ),
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
