import 'package:clock_ui/screen/widgets/clock.dart';
import 'package:clock_ui/screen/widgets/country_card.dart';
import 'package:clock_ui/screen/widgets/time_hours_and_minutes.dart';
import 'package:clock_ui/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Newport Beach, USA | PST',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const TimeInHoursAndMinutes(),
            const Spacer(),
            const Clock(),
            const Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CountryCard(
                    country: 'New York, USA',
                    timeZone: '+3 HRS | EST',
                    iconSrc: 'assets/icons/Liberty.svg',
                    time: '9:20',
                    period: 'PM',
                  ),
                  CountryCard(
                    country: 'Sydney, AU',
                    timeZone: '+19 HRS | AEST',
                    iconSrc: 'assets/icons/Sydney.svg',
                    time: '1:20',
                    period: 'AM',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
