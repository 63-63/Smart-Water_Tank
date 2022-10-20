import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_water_tank_project/colors.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.iconPath})
      : super(key: key);

  final String title;
  final String subTitle;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              iconPath,
              width: 80,
              height: 80,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
