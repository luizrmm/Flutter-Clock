import 'package:clock_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({
    required this.country,
    required this.timeZone,
    required this.iconSrc,
    required this.time,
    required this.period,
    super.key,
  });

  final String country;
  final String timeZone;
  final String iconSrc;
  final String time;
  final String period;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: SizedBox(
          width: getProportionateScreenWidth(233),
          child: AspectRatio(
            aspectRatio: 1.32,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).primaryIconTheme.color!,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    country,
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontSize: getProportionateScreenWidth(16)),
                  ),
                  const SizedBox(height: 5),
                  Text(timeZone),
                  const Spacer(),
                  Row(
                    children: [
                      SvgPicture.asset(
                        iconSrc,
                        width: getProportionateScreenWidth(40),
                        color: Theme.of(context).iconTheme.color,
                      ),
                      const Spacer(),
                      Text(
                        time,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: Text(period),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
