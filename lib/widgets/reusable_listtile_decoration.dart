import 'package:flutter/material.dart';

class ReusableListTileDecoration extends StatelessWidget {

  const ReusableListTileDecoration({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0, 1)),
        ],
      ),
      child: child,
    );
  }
}
