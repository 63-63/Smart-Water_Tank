import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smart_water_tank_project/colors.dart';
import 'package:smart_water_tank_project/widgets/reusable_listtile_decoration.dart';

class WaterMachineScreen extends StatefulWidget {
  const WaterMachineScreen({Key? key}) : super(key: key);

  @override
  State<WaterMachineScreen> createState() => _WaterMachineScreenState();
}

class _WaterMachineScreenState extends State<WaterMachineScreen> {
  // create the connection with firebase database to collect the sensors data
  final dbRef = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: const Text('Water Machine'),
      ),
      body: StreamBuilder<dynamic>(
        stream: dbRef.child('water').onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              !snapshot.hasError &&
              snapshot.data!.snapshot.value != null) {
            return Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),

                /// Switch ON/OFF Section
                ReusableListTileDecoration(
                  child: ListTile(
                    title: const Text('Machine ON/OFF'),
                    trailing: GestureDetector(
                      onTap: () {
                        dbRef.child('water').update({
                          "machine": !snapshot.data.snapshot.value['machine']
                        });
                        setState(() {});
                      },
                      child: CircleAvatar(
                        backgroundColor: snapshot.data.snapshot.value['machine']
                            ? kPrimaryColor
                            : kOFFButtonColor,
                        child: const Icon(
                          Icons.power_settings_new_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
