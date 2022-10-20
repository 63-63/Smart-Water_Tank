import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WaterTankLevelScreen extends StatelessWidget {
  WaterTankLevelScreen({Key? key}) : super(key: key);

  // create the connection with firebase database to collect the sensors data
    final dbRef = FirebaseDatabase.instance.ref().child('water');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: const Text('Water Tank Level'),
      ),
      body: StreamBuilder<dynamic>(
        stream: dbRef.onValue, // pass the reference
        builder: (context, snapshot) {
          // check if the data is coming or not
          if (snapshot.hasData &&
              !snapshot.hasError &&
              snapshot.data?.snapshot.value != null) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Lottie.asset(
                    'assets/json/water.json',
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Water Level: ${snapshot.data?.snapshot.value['tankValue']}%",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
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