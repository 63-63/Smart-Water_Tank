import 'package:flutter/material.dart';
import '../colors.dart';

class DashboardButton extends StatelessWidget {
  const DashboardButton(
      {Key? key,
      required this.primaryColor,
      required this.text,
      required this.onPress})
      : super(key: key);

  final Color primaryColor;
  final String text;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: () => onPress(),
        style: ElevatedButton.styleFrom(
          primary: primaryColor,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
          textScaleFactor: 1.3,
        ),
      ),
    );
  }
}
