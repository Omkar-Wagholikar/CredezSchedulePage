import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:motion_sensors/motion_sensors.dart';

import 'FinScheduleScreen/views/ScrollViewSchedule.dart';

class Pano extends StatefulWidget {
  const Pano({super.key});

  @override
  State<Pano> createState() => _PanoState();
}

class _PanoState extends State<Pano> {
  int _selectedIndex = 2;
  static List<Widget> pages = <Widget>[
    scrollViewTabBar(),
    Pano(),
    Pano(),
    Pano(),
    Pano(),
  ];

  Color changeColor(bool selected) {
    if (selected) {
      return Color.fromARGB(255, 255, 255, 255);
    }
    return Color.fromARGB(255, 202, 138, 255);
  }

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Placeholder(),
      body: Stack(
        children: [
          Panorama(
            // interactive: false,
            sensorControl: SensorControl.Orientation,
            animSpeed: 0.1,
            latitude: 00,
            longitude: 00,
            hotspots: const [
              // Hotspot(
              // latitude: 0.0,
              // longitude: 0.0,
              // width: 90,
              // height: 75,
              // widget: FloatingActionButton(
              //   onPressed: () =>
              //       {print("================WORKS=================")},
              //   child: Text("1234567890"),
              // )),
            ],
            // child: const AssetImage("assets/images/CalenderBgV3.png"),
            // child: Image.asset("assets/images/PanoTest1.jpg"),
            // child: Image.asset("assets/images/m2.png"),
            // child: Image.asset("assets/images/swamiKiKripa.png"),

            // child: Image.asset("assets/images/pano6.jpg"),
            child: Image.asset("assets/images/Sky2.jpeg"),

            // child: Image.asset("assets/images/panoTest2.jpeg"),
            // child: Image.asset("assets/images/DiscordV2.png"),
            // child: Image.asset("assets/images/BreadPitV1.png"),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
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
                          ? changeColor(true)
                          : changeColor(false)),
                  Icon(Icons.perm_contact_calendar,
                      size: 28,
                      color: _selectedIndex == 1
                          ? changeColor(true)
                          : changeColor(false)),
                  Icon(Icons.home,
                      size: 28,
                      color: _selectedIndex == 2
                          ? changeColor(true)
                          : changeColor(false)),
                  Icon(Icons.info_outline,
                      size: 28,
                      color: _selectedIndex == 3
                          ? changeColor(true)
                          : changeColor(false)),
                  Icon(Icons.account_circle,
                      size: 28,
                      color: _selectedIndex == 4
                          ? changeColor(true)
                          : changeColor(false)),
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
        ],
      ),
      // bottomNavigationBar:
    );
  }
}
