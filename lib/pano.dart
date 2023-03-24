import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:motion_sensors/motion_sensors.dart';

class Pano extends StatefulWidget {
  const Pano({super.key});

  @override
  State<Pano> createState() => _PanoState();
}

class _PanoState extends State<Pano> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Placeholder(),
      body: Panorama(
        sensorControl: SensorControl.Orientation,
        animSpeed: 1.0,
        latitude: 90,
        hotspots: [
          // Hotspot(
          //     latitude: 0.0,
          //     longitude: 0.0,
          //     width: 90,
          //     height: 75,
          //     widget: FloatingActionButton(
          //       onPressed: () =>
          //           {print("================WORKS=================")},
          //       child: Text("1234567890"),
          //     )),
        ],
        // child: const AssetImage("assets/images/CalenderBgV3.png"),
        // child: Image.asset("assets/images/PanoTest1.jpg"),
        // child: Image.asset("assets/images/m2.png"),
        child: Image.asset("assets/images/swamiKiKripa.png"),
        // child: Image.asset("assets/images/moonless.hdr"),
        // child: Image.asset("assets/images/panoTest2.jpeg"),
        // child: Image.asset("assets/images/DiscordV2.png"),
        // child: Image.asset("assets/images/BreadPitV1.png"),
      ),
    );
  }
}
