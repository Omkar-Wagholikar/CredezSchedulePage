import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:laptop/pano.dart';
import 'FinScheduleScreen/views/ScrollViewSchedule.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'menu.dart';

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

class SchedulePage extends StatefulWidget {
  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  double ratio = 0.2;
  int _selectedIndex = 2;
  static List<Widget> pages = <Widget>[
    scrollViewTabBar(),
    Pano(),
    Pano(),
    Pano(),
    Pano(),
  ];
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/CalenderBgV3.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => scrollViewTabBar()),
                child: const Text("Schedules 5.0"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Pano()),
                  );
                },
                child: const Text("Pano re"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WheelExample()),
                  );
                },
                child: const Text("Menu re"),
              ),
            ],
          ),
        ),
        // body: SafeArea(child: pages[_selectedIndex]),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          child: CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 2,
            // height: 60.0,
            height: 50.0,
            // ignore: prefer_const_literals_to_create_immutables
            items: <Widget>[
              Icon(Icons.event,
                  size: 28,
                  color: _selectedIndex == 0
                      ? Color.fromARGB(255, 67, 12, 112)
                      : Color.fromARGB(255, 202, 138, 255)),
              Icon(Icons.perm_contact_calendar,
                  size: 28,
                  color: _selectedIndex == 1
                      ? Color.fromARGB(255, 67, 12, 112)
                      : Color.fromARGB(255, 202, 138, 255)),
              Icon(Icons.home,
                  size: 28,
                  color: _selectedIndex == 2
                      ? Color.fromARGB(255, 251, 250, 252)
                      : Color.fromARGB(255, 202, 138, 255)),
              Icon(Icons.info_outline,
                  size: 28,
                  color: _selectedIndex == 3
                      ? Color.fromARGB(255, 67, 12, 112)
                      : Color.fromARGB(255, 202, 138, 255)),
              Icon(Icons.account_circle,
                  size: 28,
                  color: _selectedIndex == 4
                      ? Color.fromARGB(255, 67, 12, 112)
                      : Color.fromARGB(255, 202, 138, 255)),
            ],
            // color: const Color(0xff4d4dff),
            color: Colors.white.withOpacity(0.2),
            buttonBackgroundColor: Colors.white.withOpacity(0.2),
            backgroundColor: Colors.transparent,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 400),
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            letIndexChange: (index) => true,
          ),
        ),
      ),
    );
  }
}
