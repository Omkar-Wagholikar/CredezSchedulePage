// Working anim
import "package:flutter/material.dart";
// import 'package:laptop/FinScheduleScreen/views/SwichDate.dart';
// import '../../views/SmallDate.dart';
// import '../../views/BigDate.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:laptop/FinScheduleScreen/controllers/dateController.dart';
import 'package:get/get.dart';
import 'package:flip_card/flip_card.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/dateController.dart';
import 'SwichDate.dart';

class scrollViewTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(eventDateController());
    final CalendarController calenderController = CalendarController();

    print("inside topWidget: \nLENGTH: ${eventController.allDates.length}");
    print(
        "DATE: ${eventController.allDates[1].date}\nDAY: ${eventController.allDates[1].day}\nHALFDAY: ${eventController.allDates[1].day.substring(0, 3)}\nMONTH: ${eventController.allDates[1].month}\nYEAR: ${eventController.allDates[1].year}\nTop complete");

    return GetMaterialApp(
      // darkTheme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        // backgroundColor: Color.fromARGB(255, 83, 83, 83),
        appBar: AppBar(
          title: const Text("Here ya go!"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
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
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'SolThin',
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                  child: SizedBox(
                      height: 111,
                      child: Obx(() => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: eventController.allDates.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Obx(() => SwitcherWidget(
                                      date:
                                          eventController.allDates[index].date,
                                      fullDay:
                                          eventController.allDates[index].day,
                                      halfday: eventController
                                          .allDates[index].day
                                          .substring(0, 3),
                                      isFirst:
                                          eventController.activeDates[index],
                                      month:
                                          eventController.allDates[index].month,
                                      year:
                                          eventController.allDates[index].year,
                                      index_: index,
                                      calenderController: calenderController,
                                    )),
                              );
                            },
                          ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
  return FlipCard(
    front: Container(
      // color: appointment.color,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(1, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(
                  appointment.subject,
                  style: const TextStyle(
                      fontFamily: 'solthin', fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              child: Icon(
                Icons.ac_unit,
                size: 45,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    ),
    back: Placeholder(),
  );
}
