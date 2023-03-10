import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class GlassEvent extends StatelessWidget {
  late String name;
  late String venue;
  late String teamStatus;
  late String date;
  late String backData;

  double ratio = 0.65;
  double start = 0.3;
  double end = 0.7;
  GlassEvent(this.name, this.venue, this.teamStatus, this.date, this.backData,
      {super.key});

  @override
  Widget build(BuildContext context) {
    double opacity = 0.25;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: FlipCard(
          front: Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(start),
                  Colors.white.withOpacity(end),
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * ratio,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25)),
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
                SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width * (1 - ratio) - 20,
                  child: const Icon(
                    Icons.ac_unit,
                    size: 90,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          back: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(start),
                  Colors.white.withOpacity(end),
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                width: 1.5,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
            width: MediaQuery.of(context).size.width * ratio,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(backData,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
