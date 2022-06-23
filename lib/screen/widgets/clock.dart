import 'dart:async';
import 'dart:math';

import 'package:clock_ui/contants.dart';
import 'package:clock_ui/models/my_theme_model.dart';
import 'package:clock_ui/screen/widgets/clock_painter.dart';
import 'package:clock_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) => setState(() {
        _dateTime = DateTime.now();
      }),
    );
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: kShadowColor.withOpacity(0.14),
                      blurRadius: 64,
                    )
                  ],
                ),
                child: Transform.rotate(
                  angle: -pi / 2,
                  child: CustomPaint(
                    painter: ClockPainter(context, _dateTime),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Consumer<MyThemeModel>(
              builder: (context, theme, child) => GestureDetector(
                onTap: theme.changeTheme,
                child: SvgPicture.asset(
                  theme.isLightTheme
                      ? 'assets/icons/Sun.svg'
                      : 'assets/icons/Moon.svg',
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          )
        ],
      );
}
