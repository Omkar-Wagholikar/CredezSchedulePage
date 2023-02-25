import 'dart:async';

import 'package:flutter/material.dart';
import '../controllers/scheduleControllers.dart';
import 'package:get/get.dart';
import '../views/singleEventScheduleCard.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: '26 Feb'),
  Tab(text: '27 Feb'),
  Tab(text: '28 Feb'),
];

class T2Tabs extends StatelessWidget {
  final getController = Get.put(ScheduleController());

  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(changeAciveTabs);
  }

  void changeAciveTabs() {
    if (scrollController.offset > 150 * 6) {}
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);

        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            print(tabController.index);
            if (tabController.index == 1) {
              print("DO SOMETHING!!");
              Timer(Duration(milliseconds: 100), () {
                scrollController.jumpTo(138 * 7);
                // scrollController.animateTo(
                //   scrollController.position.minScrollExtent + 150 * 6,
                //   curve: Curves.easeOut,
                //   duration: const Duration(milliseconds: 750),
                // );
              });
            } else if (tabController.index == 2) {
              Timer(Duration(milliseconds: 100), () {
                scrollController.jumpTo(148 * 14);
                // scrollController.animateTo(
                //   scrollController.position.minScrollExtent + 150 * 14,
                //   curve: Curves.easeOut,
                //   duration: const Duration(milliseconds: 750),
                // );
              });
            }
          }
        });
        return Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: tabs.map((Tab tab) {
              return Center(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: getController.allEvents.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: IndividualEvent(
                          getController.allEvents[index].name,
                          getController.allEvents[index].venue,
                          getController.allEvents[index].teamStatus,
                          getController.allEvents[index].day.toString()),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
