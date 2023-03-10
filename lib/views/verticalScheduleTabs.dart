import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laptop/views/glassIndividualEvent.dart';
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
      animationDuration: Duration.zero,
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);

        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            print(tabController.index);
            if (tabController.index == 1) {
              print("DO SOMETHING!!");
              Timer(Duration(milliseconds: 1), () {
                scrollController.jumpTo(138 * 7);
              });
            } else if (tabController.index == 2) {
              Timer(Duration(milliseconds: 1), () {
                scrollController.jumpTo(148 * 14);
              });
            }
          }
        });
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 28, 28, 28),

          // appBar: AppBar(
          //   // ignore: prefer_const_constructors
          //   bottom: TabBar(
          //     tabs: tabs,
          //   ),
          // ),

          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                    image: AssetImage("assets/images/stars.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              TabBarView(
                controller: tabController,
                children: tabs.map((Tab tab) {
                  return Column(
                    // mainAxisSize: MainAxisSize.min,

                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.95,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                              image: AssetImage("assets/images/stars.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: const TabBar(
                            indicatorColor: Colors.orange,
                            tabs: tabs,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/gifs/blackHole.gif"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: ListView.builder(
                                  controller: scrollController,
                                  itemCount: getController.allEvents.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 10),
                                      // child: IndividualEvent(
                                      //     getController.allEvents[index].name,
                                      //     getController.allEvents[index].venue,
                                      //     getController.allEvents[index].teamStatus,
                                      //     getController.allEvents[index].day.toString()),
                                      child: GlassEvent(
                                          getController.allEvents[index].name,
                                          getController.allEvents[index].venue,
                                          getController
                                              .allEvents[index].teamStatus,
                                          getController.allEvents[index].day
                                              .toString(),
                                          getController
                                              .allEvents[index].backInfo
                                              .toString()),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
