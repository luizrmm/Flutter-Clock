import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  ClockPainter(this.context, this.dateTime);

  final BuildContext context;
  final DateTime dateTime;
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);

    //Second Calculation
    //size.width * 0.4 define our line height
    //dateTime.second * 6 because 360/60 = 6
    final secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);

    final secondY =
        centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);

    //Second Line
    canvas.drawLine(
      center,
      Offset(secondX, secondY),
      Paint()..color = Theme.of(context).primaryColor,
    );

    //Minute Calculation
    final minX =
        centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    final minY =
        centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);

    //Minute line
    canvas.drawLine(
      center,
      Offset(minX, minY),
      Paint()
        ..color = Theme.of(context).primaryColorDark
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10,
    );

    //Hour Calculation
    // dateTime.hour * 30 because 360/12 = 30
    // dateTime.minute * 0.5 each minute we want to turn our hour line a little
    final hourX = centerX +
        size.width *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    final hourY = centerY +
        size.width *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    //Hour Line
    canvas.drawLine(
      center,
      Offset(hourX, hourY),
      Paint()
        ..color = Theme.of(context).colorScheme.secondary
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10,
    );

    //Center Dots
    final dotPaint = Paint()..color = Theme.of(context).primaryIconTheme.color!;
    canvas
      ..drawCircle(
        center,
        24,
        dotPaint,
      )
      ..drawCircle(
        center,
        23,
        Paint()..color = Theme.of(context).backgroundColor,
      )
      ..drawCircle(center, 10, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
