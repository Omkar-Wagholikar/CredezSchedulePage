import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SFCAL extends StatelessWidget {
  const SFCAL({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SfCalendar(
        backgroundColor: Colors.transparent,
        view: CalendarView.day,
        appointmentBuilder: appoint,
        appointmentTextStyle: const TextStyle(
            fontFamily: 'SolThin',
            fontSize: 25,
            color: Color.fromARGB(255, 255, 255, 255),
            letterSpacing: 5,
            fontWeight: FontWeight.bold),
        dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      color: Colors.amber,
      startTime: startTime,
      endTime: endTime,
      subject: "Test1"));

  meetings.add(Appointment(
      color: Colors.red,
      startTime: DateTime(today.year, today.month, today.day, 10, 0, 0),
      endTime: DateTime(today.year, today.month, today.day, 12, 0, 0)
          .add(const Duration(hours: 2)),
      subject: "Test2"));
  meetings.add(Appointment(
      color: Color.fromARGB(255, 244, 54, 143),
      startTime: DateTime(today.year, today.month, today.day, 5 + 12, 0, 0),
      endTime: DateTime(today.year, today.month, today.day, 5 + 12, 0, 0)
          .add(const Duration(hours: 1, minutes: 30)),
      subject: "Test2"));
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
