import 'dart:async';

import 'package:flutter/material.dart';

class Cronometer extends StatefulWidget {
  const Cronometer({super.key});

  @override
  State<Cronometer> createState() => _CronometerState();
}

class _CronometerState extends State<Cronometer> {
  int miliseconds = 0;
  bool isRunning = false;
  late Timer timer;
  List<Duration> lapTimes = [];
  Duration previousTime = Duration.zero;

  void startCronometer() {
    if (!isRunning) {
      timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        miliseconds += 11;
        setState(() {});
      });
      isRunning = true;
    }
  }

  void stopCronometer() {
    timer.cancel();
    isRunning = false;
  }

  String timeFormat(Duration duration) {
    String twoValues(int value) {
      return value >= 10 ? "$value" : "0$value";
    }

    String hours = twoValues(duration.inHours);
    String minutes = twoValues(duration.inMinutes.remainder(60));
    String seconds = twoValues(duration.inSeconds.remainder(60));
    String miliseconds = twoValues(duration.inMilliseconds.remainder(1000));
    miliseconds = miliseconds[0] + miliseconds[1];
    return "$hours:$minutes:$seconds:$miliseconds";
  }

  void restartCronometer() {
    miliseconds = 0;
    previousTime = Duration.zero;
    lapTimes = [];
    setState(() {});
  }

  void addLap() {
    if (isRunning) {
      Duration currentTime = Duration(milliseconds: miliseconds);
      lapTimes.insert(0, currentTime - previousTime);
      previousTime = currentTime;
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  timeFormat(Duration(milliseconds: miliseconds)),
                  style: const TextStyle(fontSize: 60, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                          child: const Icon(
                            Icons.play_circle_fill_rounded,
                            size: 60,
                            color: Colors.lime,
                          ),
                          onPressed: () {
                            startCronometer();
                          }),
                      MaterialButton(
                          child: const Icon(
                            Icons.stop_circle_rounded,
                            size: 60,
                            color: Colors.lime,
                          ),
                          onPressed: () {
                            stopCronometer();
                          }),
                      MaterialButton(
                          child: const Icon(
                            Icons.replay_circle_filled_rounded,
                            size: 60,
                            color: Colors.lime,
                          ),
                          onPressed: () {
                            restartCronometer();
                          }),
                      MaterialButton(
                          child: const Icon(
                            Icons.flag_circle_rounded,
                            size: 60,
                            color: Colors.lime,
                          ),
                          onPressed: () {
                            addLap();
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Visibility(visible: lapTimes.isNotEmpty, child: showList()),
        )
      ],
    );
  }

  ListView showList() {
    List<Duration> laps = List.from(lapTimes);
    laps.insert(0, Duration(milliseconds: miliseconds) - previousTime);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: laps.length,
      itemBuilder: (context, index) {
        Duration lapTime = laps[index];
        Duration accumulatedTime = Duration(
          milliseconds: laps.sublist(index).fold<int>(
              0,
              (previousValue, element) =>
                  previousValue + element.inMilliseconds),
        );
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.lime,
          ),
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: const Icon(Icons.flag),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text('Vueltas'),
                    Text(
                      "${laps.length - index}",
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Hora'),
                    Text(timeFormat(lapTime),
                        style: const TextStyle(fontSize: 15)),
                  ],
                ),
                Column(
                  children: [
                    const Text('Total'),
                    Text(timeFormat(accumulatedTime),
                        style: const TextStyle(fontSize: 15)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
