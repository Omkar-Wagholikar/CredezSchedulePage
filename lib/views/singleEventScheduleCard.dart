import 'package:flutter/material.dart';

class IndividualEvent extends StatelessWidget {
  late String name;
  late String venue;
  late String teamStatus;

  late String date;
  IndividualEvent(this.name, this.venue, this.teamStatus, this.date,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.tealAccent,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.80 * 0.75,
              height: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                color: Color.fromRGBO(80, 80, 80, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(name,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25)),
                    const SizedBox(
                      height: 11,
                    ),
                    Text(venue,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    Text(date,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(teamStatus,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.80 * 0.25,
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.teal,
              ),
              child: const Icon(
                Icons.ac_unit,
                size: 90,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
