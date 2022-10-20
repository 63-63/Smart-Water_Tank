import 'package:flutter/material.dart';
import 'package:smart_water_tank_project/widgets/reusable_card.dart';
import 'package:firebase_database/firebase_database.dart';

class TempHumScreen extends StatefulWidget {
  const TempHumScreen({Key? key}) : super(key: key);
  @override
  State<TempHumScreen> createState() => _TempHumScreenState();
}

class _TempHumScreenState extends State<TempHumScreen> {
  // create the connection with firebase database to collect the sensors data
  final dbRef = FirebaseDatabase.instance.ref().child('weather');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: const Text('Temp & Humidity'),
      ),
      body: StreamBuilder<dynamic>(
        stream: dbRef.onValue, // pass the reference
        builder: (context, snapshot) {
          // check if the data is coming or not
          if (snapshot.hasData &&
              !snapshot.hasError &&
              snapshot.data?.snapshot.value != null) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 200,
                  child: Row(
                    children: [
                      ReusableCard(
                        title: 'Temperature',
                        subTitle: "${snapshot.data?.snapshot.value['temp']}°C",
                        iconPath: 'assets/json/temp.json',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ReusableCard(
                        title: 'Humidity',
                        subTitle: "${snapshot.data?.snapshot.value['hum']}%",
                        iconPath: 'assets/json/humidity.json',
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            // if the values are not coming then show the loading bar
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
