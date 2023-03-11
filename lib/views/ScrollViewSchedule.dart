// Working anim
import "package:flutter/material.dart";
import 'SmallDate.dart';
import 'BigDate.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:laptop/controllers/dateController.dart';
import 'package:get/get.dart';

class scrollViewTabBar extends StatefulWidget {
  const scrollViewTabBar({super.key});

  @override
  State<scrollViewTabBar> createState() => _scrollViewTabBarState();
}

class _scrollViewTabBarState extends State<scrollViewTabBar> {
  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(eventDateController());
    var currentTime = DateTime(2023, 3, 1);
    var calenderController = CalendarController();
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
                              )),
                        );
                      },
                    ))),
            Expanded(
              child: SfCalendar(
                controller: calenderController,
                view: CalendarView.day,
                // initialDisplayDate: DateTime(2023, 3, 11),
                // initialDisplayDate: currentTime,
                initialSelectedDate: DateTime(2023, 3, 15),
                timeSlotViewSettings:
                    const TimeSlotViewSettings(endHour: 9 + 12, startHour: 7),
              ),
            ),
            ElevatedButton(
                onPressed: () => setState(() {
                      print("Start jump");
                      calenderController.displayDate = DateTime(2023, 3, 12);
                      print("End jump");
                    }),
                child: const Text("123456"))
          ],
        ),
      ),
    );
  }
}

class SwitcherWidget extends StatelessWidget {
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
      required this.index_});

  final eventController = Get.put(eventDateController());

  @override
  Widget build(BuildContext context) {
    print("BUILT WIDGET: $halfday $fullDay $month $date $year");
    return InkWell(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        // transitionBuilder: (Widget child, Animation<double> animation) {
        //   return SlideTransition(
        //     position: Tween<Offset>(
        //       begin: const Offset(1.0, 0.0),
        //       end: const Offset(0.0, 0.0),
        //     ).animate(animation),
        //     child: child,
        //   );
        // },
        child: isFirst == true
            ? smallDate(day: halfday, date: date)
            : bigDate(weekDay: fullDay, month: month, date: date, year: year),
      ),
      onTap: () => eventController.changeSelectedDate(index_),
    );
  }
}
