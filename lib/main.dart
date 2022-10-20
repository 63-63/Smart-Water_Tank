import 'package:flutter/material.dart';
import 'package:smart_water_tank_project/screens/splash_screen.dart';
import 'package:smart_water_tank_project/colors.dart';
import 'package:firebase_core/firebase_core.dart';

import 'colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Check',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}
