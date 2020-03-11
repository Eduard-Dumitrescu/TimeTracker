import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timetracker/utils/utils.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: TimerText(
          checkedIn: DateTime.now(),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
    ;
  }
}

class TimerText extends StatefulWidget {
  final DateTime checkedIn;

  TimerText({Key key, this.checkedIn}) : super(key: key);

  @override
  _TimerTextState createState() => _TimerTextState();
}

class _TimerTextState extends State<TimerText> {
  Timer _timer;
  bool timeIsDone = false;
  final ValueNotifier<String> _timerText =
      ValueNotifier<String>("00:00:00 left");

  @override
  void initState() {
    super.initState();
    _initCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
        valueListenable: _timerText,
        builder: (context, value, _) {
          return Text(value);
        });
  }

  void _initCountdown() {
    final Duration timeLeft = widget.checkedIn
        .add(Duration(hours: 8, minutes: 30))
        .difference(DateTime.now());
    int secondsLeft = timeLeft.inSeconds;
    _timer?.cancel();

    const oneDecimal = const Duration(milliseconds: 1000);
    _timer = new Timer.periodic(oneDecimal, (Timer timer) {
      final currentDuration = Duration(seconds: secondsLeft);
      final int hours = currentDuration.inHours;
      final int minutes = currentDuration.inMinutes.remainder(60);
      final int seconds = currentDuration.inSeconds.remainder(60);

      _timerText.value =
          "${Utils.showZero(hours)}$hours:${Utils.showZero(minutes)}$minutes:${Utils.showZero(seconds)}$seconds ${timeIsDone ? "overtime" : "left"}";

      if (secondsLeft == 0) {
        timeIsDone = true;
      }

      secondsLeft += timeIsDone ? 1 : -1;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timerText?.dispose();
  }
}
