import 'dart:async';

import 'package:clock_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeInHoursAndMinutes extends StatefulWidget {
  const TimeInHoursAndMinutes({super.key});

  @override
  State<TimeInHoursAndMinutes> createState() => _TimeInHoursAndMinutesState();
}

class _TimeInHoursAndMinutesState extends State<TimeInHoursAndMinutes> {
  DateTime _timeOfDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = DateTime.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final period = _timeOfDay.hour >= 12 ? 'PM' : 'AM';
    final dateFormat = DateFormat('HH:mm');
    final currentTime = dateFormat.format(_timeOfDay);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentTime,
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(
          width: 5,
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            period,
            style: TextStyle(fontSize: getProportionateScreenWidth(18)),
          ),
        )
      ],
    );
  }
}
