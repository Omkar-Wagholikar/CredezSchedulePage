import 'package:flutter/material.dart';
// import 'package:laptop/views/calender.dart';
// import 'package:laptop/views/draggableSchedule.dart';
// import 'package:laptop/views/scheduleEventsList.dart';
// import 'views/ScheduleSideStepper.dart';
// import 'views/verticalScheduleTabs.dart';
import 'FinScheduleScreen/views/ScrollViewSchedule.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SchedulePage(),
    );
  }
}

class SchedulePage extends StatelessWidget {
  // const SchedulePage({Key? key}) : super(key: key);

  double ratio = 0.2;

  @override
  Widget build(BuildContext context) {
    //   return T2Tabs();
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Here ya go!",
          style: TextStyle(fontFamily: 'SolThin'),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => scrollViewTabBar()),
                );
              },
              child: const Text("Schedules 4.0"),
            ),
            ElevatedButton(
              onPressed: () => showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  // enableDrag: true,

                  isScrollControlled: true,
                  context: context,
                  builder: (context) => scrollViewTabBar()),
              child: const Text("Schedules 5.0"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        // onTap: () =>
      ),
    );
  }
}
