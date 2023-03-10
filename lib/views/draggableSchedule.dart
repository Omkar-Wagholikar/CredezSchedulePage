import 'package:flutter/material.dart';
import '../views/verticalScheduleTabs.dart';

class DraggableSchedulePage extends StatelessWidget {
  const DraggableSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return DraggableScrollableSheet(
    //     initialChildSize: 0.9,
    //     builder: (_, controller) => ListView(prototypeItem: T2Tabs()));
    return T2Tabs();
  }
}
