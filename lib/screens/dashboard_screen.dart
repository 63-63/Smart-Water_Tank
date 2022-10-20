import 'package:flutter/material.dart';
import 'package:smart_water_tank_project/screens/temp_hum_screen.dart';
import 'package:smart_water_tank_project/screens/water_machine_screen.dart';
import 'package:smart_water_tank_project/screens/water_tank_level_screen.dart';

import '../colors.dart';
import '../widgets/dashboard_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: const Text('Water Checker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DashboardButton(
            primaryColor: kPrimaryColor,
            text: 'Temp & Humidity',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const TempHumScreen(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          DashboardButton(
            primaryColor: kPrimaryColor,
            text: 'Water Tank Level',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WaterTankLevelScreen(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          DashboardButton(
            primaryColor: kPrimaryColor,
            text: 'ON/OFF Water Machine',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const WaterMachineScreen(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
