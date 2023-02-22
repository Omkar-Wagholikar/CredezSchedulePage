import 'package:flutter/material.dart';
import 'package:laptop/views/scheduleEventsList.dart';
import 'views/ScheduleSideStepper.dart';

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

  @override
  double ratio = 0.2;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            height: double.infinity,
            color: Color.fromRGBO(53, 53, 53, 1),
            width: MediaQuery.of(context).size.width * 0.20,
            child: SideStepper(),
            // child: Container(),
          ),
          Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width * 0.80,
            child: EventsList(ratio),
          )
        ],
      ),
    );
  }
}
