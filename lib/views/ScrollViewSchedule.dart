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
                appointmentBuilder: appoint,
                dataSource: MeetingDataSource(getAppointments()),
                controller: calenderController,
                view: CalendarView.day,
                
                timeSlotViewSettings: const TimeSlotViewSettings(
                  startHour: 7,
                  endHour: 21,
                  timeFormat: 'HH:mm',
                  timeInterval: Duration(minutes: 30),
                  timeTextStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
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

final eventController = Get.put(eventDateController());

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  eventController.allDates.forEach((event) {
    print("NAME: ${event.name}");
    print("START TIME: ${event.startTime}");
    print("ENDING TIME: ${event.endTime}");
    print("-------------------");
    meetings.add(Appointment(
        startTime: event.startTime,
        endTime: event.endTime,
        subject: event.name));
  });
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}

Widget appoint(BuildContext context,
    CalendarAppointmentDetails calendarAppointmentDetails) {
  final Appointment appointment = calendarAppointmentDetails.appointments.first;
  return Container(
    color: appointment.color,
    child: Row(
      children: <Widget>[
        SizedBox(
          child: Text(appointment.subject),
        ),
        const SizedBox(
          child: Icon(
            Icons.ac_unit,
            size: 45,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
